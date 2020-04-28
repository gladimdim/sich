"
I represent the Money target for the Task
"
Class {
	#name : #SLTargetMoney,
	#superclass : #SLTarget,
	#category : #Sloboda
}

{ #category : #initialization }
SLTargetMoney >> initialize [ 
localizedNameKey  := 'resources.money'.
type := 'Money'.
amount := 0.
]
