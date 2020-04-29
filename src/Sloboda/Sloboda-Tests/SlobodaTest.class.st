"
A SlobodaTest is a test class for testing the behavior of Sloboda
"
Class {
	#name : #SlobodaTest,
	#superclass : #TestCase,
	#instVars : [
		'sloboda'
	],
	#category : #'Sloboda-Tests'
}

{ #category : #running }
SlobodaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
sloboda := SLSloboda new.
]

{ #category : #tests }
SlobodaTest >> testCossacks [
sloboda cossacks: 10.
self assert: sloboda cossacks equals: 10
]

{ #category : #tests }
SlobodaTest >> testInitialize [ 
self assert: sloboda cossacks equals: 0.
self assert: sloboda money equals: 0.
self assert: sloboda name equals: 'No name'
]

{ #category : #tests }
SlobodaTest >> testMoney [
sloboda money: 10.
self assert: sloboda money equals: 10
]
