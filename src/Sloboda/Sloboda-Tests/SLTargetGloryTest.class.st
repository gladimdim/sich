"
A SLTargetGloryTest is a test class for testing the behavior of SLTargetGlory
"
Class {
	#name : #SLTargetGloryTest,
	#superclass : #TestCase,
	#category : #'Sloboda-Tests'
}

{ #category : #tests }
SLTargetGloryTest >> testInitialize [
|target|
target := SLTargetGlory  new.
self assert: target type equals: 'Glory'
]
