"
A SLTargetTest is a test class for testing the behavior of SLTarget
"
Class {
	#name : #SLTargetTest,
	#superclass : #TestCase,
	#category : #'Sloboda-Tests'
}

{ #category : #tests }
SLTargetTest >> testAmount [
|target|
target := SLTarget new amount: 100.
self assert: target amount equals: 100
]

{ #category : #tests }
SLTargetTest >> testType [
|target|
target := SLTarget new type: 'Money'.
self assert: target type equals: 'Money'
]
