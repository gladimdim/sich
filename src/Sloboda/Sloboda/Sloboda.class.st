Class {
	#name : #Sloboda,
	#superclass : #Object,
	#instVars : [
		'name',
		'money',
		'cossacks'
	],
	#category : #Sloboda
}

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

{ #category : #accessing }
Sloboda >> cossacks [
	^ cossacks
]

{ #category : #accessing }
Sloboda >> cossacks: anObject [
	cossacks := anObject
]

{ #category : #'gt-inspector-extension' }
Sloboda >> gtPreviewFor: aView [ 
<gtView>
^ aView textEditor
  text: 'Sloboda name: ', name, ' has Money: ', self money asString, '  |  ', 'Cossacks: ', self cossacks asString;
  title: 'Sloboda Stats'

]

{ #category : #initialization }
Sloboda >> initialize [
money := 0.
cossacks := 0.
name = 'No name'
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
