"
I am a Cairo FFI binding for `cairo_font_face_t`.
A `cairo_font_face_t` represents a particular font at a particular weight, slant, and other characteristic but no size, transformation, or size.

See: https://www.cairographics.org/manual/cairo-cairo-font-face-t.html
"
Class {
	#name : #AeCairoFontFace,
	#superclass : #FFIExternalObject,
	#traits : 'AeTCairoLibrary + AeTCairoDestroy',
	#classTraits : 'AeTCairoLibrary classTrait + AeTCairoDestroy classTrait',
	#category : #'Alexandrie-Cairo-Text'
}

{ #category : #finalization }
AeCairoFontFace class >> primDestroy: aHandle [
	
	self ffiCall: #( void cairo_font_face_destroy ( void* aHandle) )
]

{ #category : #'private - ffi' }
AeCairoFontFace >> primStatus [

	^ self ffiCall: #(AeCairoStatus cairo_font_face_status ( self ) )
]

{ #category : #'private - ffi' }
AeCairoFontFace >> primType [

	^ self ffiCall: #(AeCairoFontType cairo_font_face_get_type ( self ) )
]

{ #category : #accessing }
AeCairoFontFace >> status [

	^ self primStatus
]

{ #category : #accessing }
AeCairoFontFace >> type [

	^ self primType
]