"
I represent Cossacks target for the Task
"
Class {
	#name : #SLTargetCossacks,
	#superclass : #SLTarget,
	#category : #Sloboda
}

{ #category : #'as yet unclassified' }
SLTargetCossacks >> dartSourceClassName [
^ 'TargetCossacks'
]

{ #category : #initialization }
SLTargetCossacks >> initialize [ 
name := 'Cossacks'.
amount := 0.
]
