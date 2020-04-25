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
 #defaultOutput -> #json. #port -> 9090. #debugMode -> true
}.
teapot
	GET: '/sichStats' -> sich;
	GET: '/slobodaStats/<id>' -> [:req | 
		|sloboda|
		sloboda := sich sloboda: (req at: #id).
		sloboda ifNil: [TeaResponse notFound ] ifNotNil: [sloboda].
		];
	PUT: '/sendSupport/<sloboda_id>/money/<value>' -> [:req | sich addMoney: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)];
	PUT: '/sendSupport/<sloboda_id>/cossacks/<value>' -> [:req | sich addCossacks: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)];
	GET: '/tasks' -> [ :req | tasks ];
PUT: '/registerTask/<sloboda_id>/<task_name>' -> [ :req | sich registerTask: #task_name forSloboda: #sloboda_id ].
	
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
^ sloboda
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

{ #category : #accessing }
Sich >> gtPreviewFor: aView [ 
<gtView>
^ aView textEditor
  text: 'Money: ', self money asString, '  |  ', 'Cossacks: ', self cossacks asString, ' | Slobodas contributed: ', registry size asString;
  title: 'Sloboda Stats'

]

{ #category : #accessing }
Sich >> initialize [
money := 0.
cossacks := 0.
registry := Dictionary new.
tasks := SLTasks new.

tasks addTask: (SLTask new name: 'Send cossacks'; description: 'Send the specified amount of cossacks to reach this target'; target: (SLTarget cossacksWithAmount: 100)).

]

{ #category : #accessing }
Sich >> money [
	^ money
]

{ #category : #'as yet unclassified' }
Sich >> registerTask: aTaskName forSloboda: aSloboda [
|sloboda task |
task := tasks at: aTaskName.
sloboda := self sloboda: aSloboda.
sloboda addTask: task.
^ sloboda
]

{ #category : #'as yet unclassified' }
Sich >> sloboda: aSloboda [
^ registry at: aSloboda ifAbsentPut: (Sloboda withName: aSloboda withMoney: 0 withCossacks: 0 )
]

{ #category : #accessing }
Sich >> tasks [ 
^ tasks
]

{ #category : #accessing }
Sich >> tasks [
	^ tasks
]
