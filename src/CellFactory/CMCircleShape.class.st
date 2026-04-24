Class {
	#name : 'CMCircleShape',
	#superclass : 'CMShape',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'accessing' }
CMCircleShape >> extent [
    ^ (size * 2) @ (size * 2)
]

{ #category : 'accessing' }
CMCircleShape >> geometry [
    ^ BlCircleGeometry new
]
