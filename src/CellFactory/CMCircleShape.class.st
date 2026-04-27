Class {
	#name : 'CMCircleShape',
	#superclass : 'CMShape',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'examples' }
CMCircleShape class >> example [

	self new show
]

{ #category : 'accessing' }
CMCircleShape >> extent [
    ^ (size * 2) @ (size * 2)
]

{ #category : 'accessing' }
CMCircleShape >> geometry [
    ^ BlCircleGeometry new
]
