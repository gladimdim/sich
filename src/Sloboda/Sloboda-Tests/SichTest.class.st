Class {
	#name : #SichTest,
	#superclass : #TestCase,
	#instVars : [
		'sich'
	],
	#category : #'Sloboda-Tests'
}

{ #category : #running }
SichTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	sich := Sich new

]

{ #category : #tests }
SichTest >> testAddCossacks [
sich addCossacks: 50.
self assert: sich cossacks equals: 50
]

{ #category : #tests }
SichTest >> testAddCossacksFromSloboda [
|sloboda|
sich addCossacks: 27 fromSloboda: 'sloboda'.
sloboda := sich initSloboda: 'sloboda'.
self assert: sloboda cossacks equals: 27
]

{ #category : #tests }
SichTest >> testAddMoney [
sich addMoney: 50.
self assert: sich money equals: 50
]

{ #category : #tests }
SichTest >> testAddMoneyFromSloboda [
|sloboda|
sich addMoney: 28 fromSloboda: 'sloboda'.
sloboda := sich initSloboda: 'sloboda'.
self assert: sloboda money equals: 28
]

{ #category : #tests }
SichTest >> testCossacksInitializedWithZero [
self assert: sich cossacks equals: 0
]

{ #category : #tests }
SichTest >> testHasSlobodaNotRegistered [
self assert: (sich hasSloboda: 'sloboda') equals: false 
]

{ #category : #tests }
SichTest >> testHasSlobodaRegistered [
sich addMoney: 30 fromSloboda: 'sloboda'.
self assert: (sich hasSloboda: 'sloboda') equals: true 
]

{ #category : #tests }
SichTest >> testInitSlobodaForExistingName [
sich addCossacks: 13 fromSloboda: 'sloboda1'.
self assert: (sich initSloboda: 'sloboda1') cossacks equals: 13
]

{ #category : #tests }
SichTest >> testInitSlobodaForNonExistingName [
self assert: (sich initSloboda: 'sloboda') money equals: 0
]

{ #category : #tests }
SichTest >> testInitializesWithTasks [
self assert: sich tasks notNil equals: true
]

{ #category : #tests }
SichTest >> testMoneyInitializedWithZero [
self assert: sich money equals: 0
]

{ #category : #tests }
SichTest >> testSaveSlobodaWithContent [
| key content|
key := '123'.
content := '{some: "json"}'.
sich saveSloboda: key withContent: content.
self assert: (sich getSloboda: key) equals: content

]

{ #category : #tests }
SichTest >> testTasks [
self assert: sich tasks tasks size  equals: 2
]
