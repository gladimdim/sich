"
I am responsible for providing details for the Task issued by Sich. 

I have a name (should be short) and description (can be long). A target property is an instance of SLTarget subclasses.
"
Class {
	#name : #SLTask,
	#superclass : #Object,
	#instVars : [
		'target',
		'localizedKey',
		'localizedDescriptionKey',
		'iconPath'
	],
	#category : #Sloboda
}

{ #category : #accessing }
SLTask class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(localizedKey localizedDescriptionKey target) ]
]

{ #category : #accessing }
SLTask >> iconPath [
	^ iconPath
]

{ #category : #accessing }
SLTask >> iconPath: anObject [
	iconPath := anObject
]

{ #category : #accessing }
SLTask >> localizedDescriptionKey [
	^ localizedDescriptionKey
]

{ #category : #accessing }
SLTask >> localizedDescriptionKey: anObject [
	localizedDescriptionKey := anObject
]

{ #category : #accessing }
SLTask >> localizedKey [
	^ localizedKey
]

{ #category : #accessing }
SLTask >> localizedKey: anObject [
	localizedKey := anObject
]

{ #category : #accessing }
SLTask >> target [
	^ target
]

{ #category : #accessing }
SLTask >> target: anObject [
	target := anObject
]

{ #category : #'as yet unclassified' }
SLTask >> toActiveTask [
^ SLActiveTask new localizedKey: localizedKey; localizedDescriptionKey: localizedDescriptionKey;  target: target; progress: 0
]
