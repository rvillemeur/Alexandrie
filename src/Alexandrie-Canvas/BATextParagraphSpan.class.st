"
I represent an Alexandrie specific measured span
"
Class {
	#name : #BATextParagraphSpan,
	#superclass : #BATextParagraphLeaf,
	#category : #'Alexandrie-Canvas-Text'
}

{ #category : #drawing }
BATextParagraphSpan >> aeDrawOn: aeCanvas [

	self span ifNil: [ ^ self ].
	aeCanvas restoreContextAfter: [ 
		self flag: #todo. "Default color?"
		aeCanvas setSourceColor: (fontAndStyleBuilder hasCustomColor
				 ifTrue: [ fontAndStyleBuilder color ]
				 ifFalse: [ Color black ]).

		self attributes do: [ :anAttribute | 
			anAttribute aeDrawBelowOn: aeCanvas span: self
			"			anAttribute aeApplyTo: aeCanvas " ].

		aeCanvas drawText: cairoGlyphsArray font: cairoScaledFont.

		self attributes do: [ :anAttribute | 
			anAttribute aeDrawAboveOn: aeCanvas span: self ] ]
]

{ #category : #building }
BATextParagraphSpan >> getTextMetricsWithBuilder: aBlTextFontAndStyleBuilder [

	"build an abstract font and resolve not yet resolved properties"

	| metrics |
	metrics := self
		           getTextMetricsFor: self span utf8Encoded
		           withBuilder: aBlTextFontAndStyleBuilder
		           canvas: self measurer canvas.
	ascent := metrics at: #ascent.
	descent := metrics at: #descent.
	advance := metrics at: #advance.
	left := metrics at: #left.
	top := metrics at: #top.
	width := metrics at: #width.
	height := metrics at: #height
]