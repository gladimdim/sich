"
A SLTargetCossacksTest is a test class for testing the behavior of SLTargetCossacks
"
Class {
	#name : #SLTargetCossacksTest,
	#superclass : #TestCase,
	#category : #'Sloboda-Tests'
}

{ #category : #tests }
SLTargetCossacksTest >> testInitialize [
|target|
target := SLTargetCossacks new.
self assert: target type equals: 'Cossacks'
]
