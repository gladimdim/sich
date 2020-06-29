"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSloboda,
	#superclass : #PackageManifest,
	#category : #'Sloboda-Manifest'
}

{ #category : #'code-critics' }
ManifestSloboda class >> ruleRBSuperSendsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SLTarget #toDartFromJsonFactoryClassName #false)) #'2020-05-14T16:57:33.073405+03:00') )
]

{ #category : #'code-critics' }
ManifestSloboda class >> ruleRBUncommonMessageSendRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Sich class' #startServer #true)) #'2020-04-25T22:56:44.962155+03:00') )
]
