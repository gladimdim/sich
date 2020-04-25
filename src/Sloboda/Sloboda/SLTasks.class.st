Class {
	#name : #SLTasks,
	#superclass : #Object,
	#instVars : [
		'tasks'
	],
	#category : #Sloboda
}

{ #category : #accessing }
SLTasks class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(tasks) ]
]

{ #category : #adding }
SLTasks >> addTask: aTask [
tasks add: aTask
]

{ #category : #'as yet unclassified' }
SLTasks >> byName: aName [
^ (tasks select: [ :each | each name = aName ]) at: 1
]

{ #category : #initialization }
SLTasks >> initialize [
tasks := OrderedCollection  new.

]
