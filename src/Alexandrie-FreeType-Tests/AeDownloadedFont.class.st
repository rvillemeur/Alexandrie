Class {
	#name : #AeDownloadedFont,
	#superclass : #Object,
	#instVars : [
		'downloadDirectory'
	],
	#category : #'Alexandrie-FreeType-Tests'
}

{ #category : #accessing }
AeDownloadedFont >> baseUrl [

	^ self subclassResponsibility 
]

{ #category : #actions }
AeDownloadedFont >> download [
	
	('Downloading {1}...' format: { self familyName }) traceCr.

	[	ZnClient new
			url: self baseUrl, self fileName;
			numberOfRetries: 5;
			timeout: 100;
			logToTranscript;
			downloadTo: self downloadDirectory ensureCreateDirectory; yourself.

		'
Download finished - ' trace ] timeToRun traceCr.

]

{ #category : #accessing }
AeDownloadedFont >> downloadDirectory [

	^ downloadDirectory
]

{ #category : #accessing }
AeDownloadedFont >> downloadDirectory: aFileReference [

	downloadDirectory := aFileReference
]

{ #category : #actions }
AeDownloadedFont >> ensureDownloaded [

	self isDownloaded ifFalse: [
		self download ]

]

{ #category : #accessing }
AeDownloadedFont >> familyName [

	^ self subclassResponsibility 
]

{ #category : #accessing }
AeDownloadedFont >> fileName [

	^ self subclassResponsibility 
]

{ #category : #initialization }
AeDownloadedFont >> initialize [
	super initialize.
	
	downloadDirectory := AeFilesytemResources fontsDirectory / 'downloaded'
]

{ #category : #testing }
AeDownloadedFont >> isDownloaded [

	^ (self downloadDirectory / self fileName) exists
]