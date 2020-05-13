"
I represent a Sloboda or 'city'.

My main responsibilities are: tracking amount of cossacks money sent to the sich by the player.
"
Class {
	#name : #SLSloboda,
	#superclass : #Object,
	#instVars : [
		'name',
		'money',
		'cossacks',
		'activeTasks',
		'completedTaskCount'
	],
	#category : #Sloboda
}

{ #category : #accessing }
SLSloboda class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(cossacks money name activeTasks completedTaskCount ) ]
]

{ #category : #'as yet unclassified' }
SLSloboda class >> withName: aName withMoney: aMoney withCossacks: aCossacks [
|c|
c := self new.
c name: aName.
c money: aMoney.
c cossacks: aCossacks.
^c
]

{ #category : #accessing }
SLSloboda >> activeTasks [
	^ activeTasks
]

{ #category : #adding }
SLSloboda >> addCossacks: aCossacks [
cossacks := cossacks + aCossacks
]

{ #category : #adding }
SLSloboda >> addMoney: aMoney [
money := money + aMoney
]

{ #category : #adding }
SLSloboda >> addTask: anActiveTask [
(self hasActiveTask: anActiveTask localizedKey) ifFalse: [  
activeTasks add: anActiveTask toActiveTask]
]

{ #category : #'as yet unclassified' }
SLSloboda >> completeTask [
completedTaskCount := completedTaskCount + 1
]

{ #category : #accessing }
SLSloboda >> completedTaskCount [
	^ completedTaskCount
]

{ #category : #accessing }
SLSloboda >> completedTaskCount: anObject [
	completedTaskCount := anObject
]

{ #category : #accessing }
SLSloboda >> cossacks [
	^ cossacks
]

{ #category : #accessing }
SLSloboda >> cossacks: anObject [
	cossacks := anObject
]

{ #category : #accessing }
SLSloboda >> doTask: aTaskName withAmount: aNumber [
	| task |
	task := (activeTasks select: [ :t | t localizedKey = aTaskName ]) at: 1.
	task addProgress: aNumber.
	task progress >= task target amount
		ifFalse: [ ^ self ].
	activeTasks remove: task.
	self completeTask
]

{ #category : #'gt-inspector-extension' }
SLSloboda >> gtPreviewFor: aView [ 
<gtView>
^ aView textEditor
  text: 'Sloboda name: ', name, ' has Money: ', self money asString, '  |  ', 'Cossacks: ', self cossacks asString;
  title: 'Sloboda Stats'

]

{ #category : #testing }
SLSloboda >> hasActiveTask: aTaskName [
^ activeTasks anySatisfy: [ :each | each localizedKey = aTaskName ]
]

{ #category : #initialization }
SLSloboda >> initialize [
money := 0.
cossacks := 0.
name := 'No name'.
activeTasks := OrderedCollection  new.
completedTaskCount := 0.
]

{ #category : #accessing }
SLSloboda >> money [
	^ money
]

{ #category : #accessing }
SLSloboda >> money: anObject [
	money := anObject
]

{ #category : #accessing }
SLSloboda >> name [
	^ name
]

{ #category : #accessing }
SLSloboda >> name: anObject [
	name := anObject
]
