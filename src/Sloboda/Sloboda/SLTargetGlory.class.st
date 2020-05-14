"
I represent the Glory target for the Task

"
Class {
	#name : #SLTargetGlory,
	#superclass : #SLTarget,
	#category : #Sloboda
}

{ #category : #initialization }
SLTargetGlory >> initialize [ 
localizedKey := 'Glory'.
amount := 0
]

{ #category : #'as yet unclassified' }
SLTargetGlory >> toDartFromJsonFactoryClassName [ 
^ ((super class) superclass new) dartSourceClassName 
]
