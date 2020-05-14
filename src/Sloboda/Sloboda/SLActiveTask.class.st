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
mapper for: self do: [ :mapping | mapping mapInstVars: #(localizedKey localizedDescriptionKey target progress iconPath) ]
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
