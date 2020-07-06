"
The main entry point for the HTTP server.
"
Class {
	#name : #Sich,
	#superclass : #Object,
	#instVars : [
		'cossacks',
		'money',
		'registry',
		'tasks',
		'dbPath'
	],
	#classInstVars : [
		'server',
		'active',
		'tasks'
	],
	#category : #Sloboda
}

{ #category : #accessing }
Sich class >> active [
	^ active
]

{ #category : #'as yet unclassified' }
Sich class >> loadDeps [
Metacello new
	baseline: 'Teapot';
	repository: 'github://zeroflag/teapot:master/source';
	load.

Metacello new
  repository: 'github://svenvc/NeoJSON/repository';
  baseline: 'NeoJSON';
  load.
]

{ #category : #accessing }
Sich class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(cossacks money tasks registry) ]
]

{ #category : #accessing }
Sich class >> server [
	^ server
]

{ #category : #server }
Sich class >> startServer [
| sich teapot |
 sich := self new.
 tasks := SLTasks new.
 teapot := Teapot allInstances last.
 teapot ifNil: [ teapot := Teapot  ].
 teapot stop.
 teapot := Teapot configure: {
 #defaultOutput -> #json. #port -> 9090. #debugMode -> true
}.
teapot
	GET: '/sich' -> sich;
	GET: '/sich/slobodas/<name>' -> [:req | 
		 sich initSloboda: (req at: #name)
		];
	PUT: '/sich/slobodas/<sloboda_id>/sendMoney/<value>' -> [:req | sich addMoney: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)];
	PUT: '/sich/slobodas/<sloboda_id>/sendCossacks/<value>' -> [:req | sich addCossacks: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)];
	GET: '/tasks' -> [ :req | sich tasks ];
   PUT: '/sich/slobodas/<sloboda_id>/registerTask/<taskName>' -> [ :req | sich registerTask: (req at: #taskName) forSloboda: (req at: #sloboda_id) ];
   POST: '/sich/slobodas/<sloboda_id>/doTask/<task>/<amount>' -> [ :req |
	(sich hasSloboda: (req at: #sloboda_id))
	ifTrue: ([ sich doTask: (req at: #task) forSloboda: (req at:  #sloboda_id) withAmount: ((req at: #amount) asInteger) ] on: SubscriptOutOfBounds do: [ TeaResponse notFound  ])
	ifFalse: [ TeaResponse notFound ]
	 ];
   POST: '/sich/db/states/' -> [ :req | sich postStateForRequest: req ]; output: #text;
	 POST: '/sich/db/states/<key>' -> [ :req | sich postStateForRequest: req ]; output: #text;
   GET: '/sich/db/states/<key>' -> [ :req | sich getStateForRequest: req ]; output: #json.
	
	teapot start.
	server := teapot.
		active := sich.
	^ sich

]

{ #category : #server }
Sich class >> stopServer [
server stop
]

{ #category : #accessing }
Sich >> addCossacks: aNumber [
cossacks := cossacks + (aNumber asNumber)
]

{ #category : #accessing }
Sich >> addCossacks: aNumber fromSloboda: aSloboda [
|sloboda|
cossacks := cossacks + (aNumber asNumber).
sloboda := self initSloboda: aSloboda.
sloboda addCossacks: aNumber.

]

{ #category : #accessing }
Sich >> addMoney: aNumber [
money := money + (aNumber asNumber)
]

{ #category : #accessing }
Sich >> addMoney: aNumber fromSloboda: aSloboda [
|sloboda|
money := money + (aNumber asNumber).
sloboda :=  self initSloboda: aSloboda.
sloboda addMoney: aNumber.
sloboda
  
]

{ #category : #accessing }
Sich >> cossacks [
	^ cossacks
]

{ #category : #'as yet unclassified' }
Sich >> doTask: aTaskName forSloboda: aSlobodaName withAmount: aNumber [
|sloboda task|
sloboda := self initSloboda: aSlobodaName.
task := sloboda doTask: aTaskName withAmount: aNumber.
^ sloboda
]

{ #category : #'as yet unclassified' }
Sich >> getStateForRequest: aRequest [
|key stream working|
working := FileSystem disk workingDirectory / dbPath.
key := aRequest at: #key.
(working / key) exists ifTrue: [ stream := (working / key) readStream .
^ (NeoJSONReader fromString: stream contents). ] ifFalse: [ ^ TeaResponse notFound ]

]

{ #category : #accessing }
Sich >> gtPreviewFor: aView [ 
<gtView>
^ aView textEditor
  text: 'Money: ', self money asString, '  |  ', 'Cossacks: ', self cossacks asString, ' | Slobodas contributed: ', registry size asString;
  title: 'Sloboda Stats'

]

{ #category : #testing }
Sich >> hasSloboda: aSlobodaName [
^ registry anySatisfy: [ :each | each name = aSlobodaName ]
]

{ #category : #'as yet unclassified' }
Sich >> initSloboda: aSlobodaName [
^ registry at: aSlobodaName ifAbsentPut: (SLSloboda withName: aSlobodaName withMoney: 0 withCossacks: 0 )
]

{ #category : #accessing }
Sich >> initialize [
money := 0.
cossacks := 0.
registry := Dictionary new.
dbPath := 'db/states'.
self resetTasks

]

{ #category : #accessing }
Sich >> money [
	^ money
]

{ #category : #'as yet unclassified' }
Sich >> postStateForRequest: aRequest [
 |payload key stream working|
working := FileSystem disk workingDirectory / dbPath.
key := aRequest at: #key ifAbsent: (String generateRandom: 4).
payload := (NeoJSONReader fromString: (aRequest entity contents)).
(working / key) ensureCreateFile.
stream := (working / key) writeStream.
stream nextPutAll: (NeoJSONWriter toString: payload).
stream close.
^ key 
]

{ #category : #'as yet unclassified' }
Sich >> registerTask: aTaskName forSloboda: aSloboda [
|sloboda task |
task := tasks byLocalizedKey: aTaskName.
sloboda := self initSloboda: aSloboda.
sloboda addTask: task.
^ sloboda
]

{ #category : #initialization }
Sich >> resetTasks [
tasks := SLTasks new.
tasks addTask: (SLTask new localizedKey: 'sichTasks.sendCossacks'; localizedDescriptionKey: 'sichTasks.sendCossacksDescription'; target: (SLTarget cossacksWithAmount: 100); iconPath: 'images/city_props/cossack_64.png').
tasks addTask: (SLTask new localizedKey: 'sichTasks.sendMoney'; localizedDescriptionKey: 'sichTasks.sendMoneyDescription'; target: (SLTarget moneyWithAmount: 100); iconPath: 'images/resources/food_64.png').
]

{ #category : #accessing }
Sich >> tasks [ 
^ tasks
]
