"
I represent a Sloboda or 'city'.

My main responsibilities are: tracking amount of cossacks money sent to the sich by the player.
"
Class {
	#name : #Sloboda,
	#superclass : #Object,
	#instVars : [
		'name',
		'money',
		'cossacks',
		'activeTasks'
	],
	#category : #Sloboda
}

{ #category : #accessing }
Sloboda class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(cossacks money name activeTasks) ]
]

{ #category : #'as yet unclassified' }
Sloboda class >> withName: aName withMoney: aMoney withCossacks: aCossacks [
|c|
c := self new.
c name: aName.
c money: aMoney.
c cossacks: aCossacks.
^c
]

{ #category : #adding }
Sloboda >> addCossacks: aCossacks [
cossacks := cossacks + aCossacks
]

{ #category : #adding }
Sloboda >> addMoney: aMoney [
money := money + aMoney
]

{ #category : #adding }
Sloboda >> addTask: anActiveTask [
activeTasks add: anActiveTask toActiveTask
]

{ #category : #accessing }
Sloboda >> cossacks [
	^ cossacks
]

{ #category : #accessing }
Sloboda >> cossacks: anObject [
	cossacks := anObject
]

{ #category : #'as yet unclassified' }
Sloboda >> doTask: aTaskName withAmount: aNumber [
|task |
task := (activeTasks select: [ :t | t name = aTaskName ]) at: 1.
task addProgress: aNumber.


]

{ #category : #'gt-inspector-extension' }
Sloboda >> gtPreviewFor: aView [ 
<gtView>
^ aView textEditor
  text: 'Sloboda name: ', name, ' has Money: ', self money asString, '  |  ', 'Cossacks: ', self cossacks asString;
  title: 'Sloboda Stats'

]

{ #category : #testing }
Sloboda >> hasActiveTask: aTaskName [
^ activeTasks anySatisfy: [ :each | each name = aTaskName ]
]

{ #category : #initialization }
Sloboda >> initialize [
money := 0.
cossacks := 0.
name := 'No name'.
activeTasks := OrderedCollection  new.
]

{ #category : #accessing }
Sloboda >> money [
	^ money
]

{ #category : #accessing }
Sloboda >> money: anObject [
	money := anObject
]

{ #category : #accessing }
Sloboda >> name [
	^ name
]

{ #category : #accessing }
Sloboda >> name: anObject [
	name := anObject
]
