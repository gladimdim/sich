Extension { #name : #String }

{ #category : #'*Sloboda' }
String class >> generateRandom: aLength [

^ self streamContents: [ :s | aLength timesRepeat: [ s nextPut: (Character codePoint: (97 to: 122) atRandom)  ] ]
]
