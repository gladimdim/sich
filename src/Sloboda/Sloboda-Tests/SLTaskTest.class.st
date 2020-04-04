Class {
	#name : #SLTaskTest,
	#superclass : #TestCase,
	#category : #'Sloboda-Tests'
}

{ #category : #tests }
SLTaskTest >> testDescription [
|task|
task := SLTask new description: 'Task1'.
self assert: task description equals: 'Task1'
]

{ #category : #tests }
SLTaskTest >> testName [ 
|task|
task := SLTask new name: 'Task1'.
self assert: task name equals: 'Task1'
]

{ #category : #tests }
SLTaskTest >> testTarget [ 
|task|
task := SLTask new target: (SLTargetMoney withAmount: 100).
self assert: task target amount equals: 100.
self assert: task target name equals: 'Money'
]
