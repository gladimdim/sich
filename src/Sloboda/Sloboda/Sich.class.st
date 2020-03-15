"
The main entry point for the HTTP server.
"
Class {
	#name : #Sich,
	#superclass : #Object,
	#instVars : [
		'cossacks',
		'money',
		'registry'
	],
	#classInstVars : [
		'server',
		'active'
	],
	#category : #Sloboda
}

{ #category : #accessing }
Sich class >> active [
	^ active
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
 teapot := Teapot allInstances last.
 teapot ifNil: [ teapot := Teapot  ].
 teapot stop.
 teapot := Teapot configure: {
 #defaultOutput -> #json. #port -> 9090. #debugMode -> true
}.
teapot
	GET: '/sichStats' -> sich;
	PUT: '/sendSupport/<sloboda_id>/money/<value>' -> [:req | sich addMoney: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)];
	PUT: '/sendSupport/<sloboda_id>/cossacks/<value>' -> [:req | sich addCossacks: ((req at: #value) asInteger) fromSloboda: (req at: #sloboda_id)].
	
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
sloboda := (registry at: aSloboda ifAbsentPut: (Sloboda withName: aSloboda withMoney: 0 withCossacks: 0 )).
sloboda addCossacks: aNumber.
sloboda
]

{ #category : #accessing }
Sich >> addMoney: aNumber [
money := money + (aNumber asNumber)
]

{ #category : #accessing }
Sich >> addMoney: aNumber fromSloboda: aSloboda [
|sloboda|
money := money + (aNumber asNumber).
sloboda := (registry at: aSloboda ifAbsentPut: (Sloboda withName: aSloboda withMoney: 0 withCossacks: 0 )).
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
registry := Dictionary new

]

{ #category : #accessing }
Sich >> money [
	^ money
]
