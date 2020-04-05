"
I am responsible for providing details for the Task issued by Sich. 

I have a name (should be short) and description (can be long). A target property is an instance of SLTarget subclasses.
"
Class {
	#name : #SLTask,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'target'
	],
	#category : #Sloboda
}

{ #category : #accessing }
SLTask class >> neoJsonMapping: mapper [
mapper for: self do: [ :mapping | mapping mapInstVars: #(name description target) ]
]

{ #category : #accessing }
SLTask >> description [
	^ description
]

{ #category : #accessing }
SLTask >> description: anObject [
	description := anObject
]

{ #category : #accessing }
SLTask >> name [
	^ name
]

{ #category : #accessing }
SLTask >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SLTask >> target [
	^ target
]

{ #category : #accessing }
SLTask >> target: anObject [
	target := anObject
]
