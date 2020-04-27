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
		'tasks'
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
mapper for: self do: [ :mapping | mapping mapInstVars: #(cossacks money) ]
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
 #defaultOutput -> #json. #port -> 10100. #debugMode -> true
}.
teapot
	GET: '/sichStats' -> sich;
	GET: '/slobodaStats/<id>' -> [:req | 
		|sloboda|
		(sich hasSloboda: (req at: #id)) ifTrue: [ sich sloboda: (req at: #id) ] ifFalse: [ TeaResponse notFound ]
		];
	PUT: '/sendSupport/<sloboda_id>/money/<value>' -> [:req | sich addMoney: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)];
	PUT: '/sendSupport/<sloboda_id>/cossacks/<value>' -> [:req | sich addCossacks: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)];
	GET: '/tasks' -> [ :req | sich tasks ];
   PUT: '/registerTask/<sloboda_id>/<taskName>' -> [ :req | sich registerTask: (req at: #taskName) forSloboda: (req at: #sloboda_id) ];
   PUT: '/doTask/<sloboda_id>/<task>/<amount>' -> [ :req |
	(sich hasSloboda: (req at: #sloboda_id))
	ifTrue: ([ sich doTask: (req at: #task) forSloboda: (req at:  #sloboda_id) withAmount: ((req at: #amount) asInteger) ] on: SubscriptOutOfBounds do: [ TeaResponse notFound  ])
	ifFalse: [ TeaResponse notFound ]
	 ].
	
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
sloboda := self sloboda: aSloboda.
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
sloboda :=  self sloboda: aSloboda.
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
sloboda := self sloboda: aSlobodaName.
sloboda doTask: aTaskName withAmount: aNumber.
^ sloboda
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

{ #category : #accessing }
Sich >> initialize [
money := 0.
cossacks := 0.
registry := Dictionary new.
tasks := SLTasks new.

tasks addTask: (SLTask new name: 'SendCossacks'; description: 'Send the specified amount of cossacks to reach this target'; target: (SLTarget cossacksWithAmount: 100)).

]

{ #category : #accessing }
Sich >> money [
	^ money
]

{ #category : #'as yet unclassified' }
Sich >> registerTask: aTaskName forSloboda: aSloboda [
|sloboda task |
task := tasks byName: aTaskName.
sloboda := self sloboda: aSloboda.
sloboda addTask: task.
^ sloboda
]

{ #category : #'as yet unclassified' }
Sich >> sloboda: aSlobodaName [
^ registry at: aSlobodaName ifAbsentPut: (Sloboda withName: aSlobodaName withMoney: 0 withCossacks: 0 )
]

{ #category : #accessing }
Sich >> tasks [ 
^ tasks
]
