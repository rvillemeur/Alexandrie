"
An AeHbBlobTest is a test class for testing the behavior of AeHbBlob
"
Class {
	#name : #AeHbBlobTest,
	#superclass : #TestCase,
	#category : #'Alexandrie-Harfbuzz-Tests'
}

{ #category : #tests }
AeHbBlobTest >> testOpenFailure [

	self
		should: [
			AeHbBlob blobCreate: AeFilesystemResources inriaSerifRegularTTF / '.doesNotExist' ]
		raise: Error
		whoseDescriptionIncludes: 'Failed to open'
		description: 'Should have problems to open this file.'.

]

{ #category : #tests }
AeHbBlobTest >> testOpenSuccess [

	self
		shouldnt: [
			AeHbBlob blobCreate: AeFilesystemResources inriaSerifRegularTTF ]
		raise: Error
]

{ #category : #test }
AeHbBlobTest >> testPrimBlobGetLength [

	| aBlob |
	aBlob := AeHbBlob blobCreate: AeFilesystemResources inriaSerifRegularTTF.

	self
		assert: aBlob primBlobGetLength
		equals: AeFilesystemResources inriaSerifRegularTTF size
]