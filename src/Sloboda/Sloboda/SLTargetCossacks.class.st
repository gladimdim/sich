"
I represent Cossacks target for the Task
"
Class {
	#name : #SLTargetCossacks,
	#superclass : #SLTarget,
	#category : #Sloboda
}

{ #category : #initialization }
SLTargetCossacks >> initialize [ 
localizedKey := 'cityProps.cossacks'.
type := 'Cossacks'.
amount := 0.
]

{ #category : #'as yet unclassified' }
SLTargetCossacks >> toDartFromJsonFactoryClassName [ 
^ ((super class) superclass new) dartSourceClassName 
]

{ #category : #'as yet unclassified' }
SLTargetCossacks >> toDartSourceCodeWithName: aPropertyName onStream: aStream [
aStream
   cr;
	nextPutAll: self toDartFromJsonFactoryClassName  ;
	space;
	nextPutAll: aPropertyName;
	space;
	nextPutAll: ';'
]
