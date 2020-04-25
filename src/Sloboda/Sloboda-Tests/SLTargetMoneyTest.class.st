"
A SLTargetMoneyTest is a test class for testing the behavior of SLTargetMoney
"
Class {
	#name : #SLTargetMoneyTest,
	#superclass : #TestCase,
	#category : #'Sloboda-Tests'
}

{ #category : #tests }
SLTargetMoneyTest >> testDefaultName [
|target|
target := SLTargetMoney  new.
self assert: target name equals: 'Money'
]

{ #category : #tests }
SLTargetMoneyTest >> testInitialize [
|target|
target := SLTargetMoney  new.
self assert: target name equals: 'Money'
]
