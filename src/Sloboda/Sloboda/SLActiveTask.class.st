Class {
	#name : #SLActiveTask,
	#superclass : #SLTask,
	#instVars : [
		'progress'
	],
	#category : #Sloboda
}

{ #category : #accessing }
SLActiveTask class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(name description target progress) ]
]

{ #category : #adding }
SLActiveTask >> addProgress: anAmount [
progress := progress + anAmount
]

{ #category : #initialization }
SLActiveTask >> initialize [
progress := 0
]

{ #category : #accessing }
SLActiveTask >> progress [
	^ progress
]

{ #category : #accessing }
SLActiveTask >> progress: anObject [
	progress := anObject
]
