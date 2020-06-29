Class {
	#name : #SLTaskTest,
	#superclass : #TestCase,
	#category : #'Sloboda-Tests'
}

{ #category : #tests }
SLTaskTest >> testTarget [ 
|task|
task := SLTask new target: (SLTargetMoney withAmount: 100).
self assert: task target amount equals: 100.
self assert: task target type equals: 'Money'
]
