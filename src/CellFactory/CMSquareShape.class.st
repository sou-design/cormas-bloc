Class {
	#name : 'CMSquareShape',
	#superclass : 'CMShape',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'accessing' }
CMSquareShape >> extent [
    ^ (size * (2 sqrt)) @ (size * (2 sqrt))
]

{ #category : 'accessing' }
CMSquareShape >> geometry [
    ^ BlSquareGeometry new
]
