"
I represent the Money target for the Task
"
Class {
	#name : #SLTargetMoney,
	#superclass : #SLTarget,
	#category : #Sloboda
}

{ #category : #'as yet unclassified' }
SLTargetMoney >> dartSourceClassName [
^ 'TargetMoney'
]

{ #category : #initialization }
SLTargetMoney >> initialize [ 
name := 'Money'.
amount := 0.
]
