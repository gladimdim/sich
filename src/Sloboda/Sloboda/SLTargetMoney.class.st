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
localizedKey  := 'resources.money'.
type := 'Money'.
amount := 0.
]

{ #category : #'as yet unclassified' }
SLTargetMoney >> toDartFromJsonFactoryClassName [ 
^ ((super class) superclass new) dartSourceClassName 
]

{ #category : #'as yet unclassified' }
SLTargetMoney >> toDartSourceCodeWithName: aPropertyName onStream: aStream [
aStream
   cr;
	nextPutAll: self toDartFromJsonFactoryClassName  ;
	space;
	nextPutAll: aPropertyName;
	space;
	nextPutAll: ';'
]
