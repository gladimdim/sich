Class {
	#name : #SLActiveTaskTest,
	#superclass : #TestCase,
	#category : #'Sloboda-Tests'
}

{ #category : #tests }
SLActiveTaskTest >> testCanAddProgress [
|t|
t := SLActiveTask new addProgress: 10.
self assert: t progress equals: 10
]

{ #category : #testing }
SLActiveTaskTest >> testCanInitialize [
|t|
t := SLActiveTask new.
self assert: t progress equals: 0
]
