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

{ #category : #initialization }
SLTasks >> initialize [
|cossacks|
cossacks := SLTask new.
cossacks name: 'Send cossacks'; description: 'Send the specified amount of cossacks to reach this target'; target: (SLTarget cossacksWithAmount: 100).
tasks := OrderedCollection  new.
tasks add: cossacks
]
