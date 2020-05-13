"
I represent main class for the Target.

If you want to create a new type of Target then subclass me with different name.
"
Class {
	#name : #SLTarget,
	#superclass : #Object,
	#instVars : [
		'type',
		'amount',
		'localizedKey'
	],
	#category : #Sloboda
}

{ #category : #'as yet unclassified' }
SLTarget class >> cossacksWithAmount: anAmount [
^ SLTargetCossacks  new amount: anAmount
]

{ #category : #'as yet unclassified' }
SLTarget class >> gloryWithAmount: anAmount [
^ SLTargetGlory new amount: anAmount
]

{ #category : #'as yet unclassified' }
SLTarget class >> moneyTarget [
^ SLTargetMoney new.
]

{ #category : #'as yet unclassified' }
SLTarget class >> moneyWithAmount: anAmount [
^ SLTargetMoney new amount: anAmount
]

{ #category : #accessing }
SLTarget class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(type localizedKey amount) ]
]

{ #category : #'as yet unclassified' }
SLTarget class >> withAmount: anAmount [
^ self new amount: anAmount
]

{ #category : #accessing }
SLTarget >> amount [
	^ amount
]

{ #category : #accessing }
SLTarget >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
SLTarget >> localizedKey [
	^ localizedKey
]

{ #category : #accessing }
SLTarget >> localizedKey: anObject [
	localizedKey := anObject
]

{ #category : #accessing }
SLTarget >> type [
	^ type
]

{ #category : #accessing }
SLTarget >> type: anObject [
	type := anObject
]
