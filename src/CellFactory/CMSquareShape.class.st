Class {
	#name : 'CMSquareShape',
	#superclass : 'CMShape',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'examples' }
CMSquareShape class >> example [

	self new show
]

{ #category : 'examples' }
CMSquareShape >> example [

	<script: 'self example'>
]

{ #category : 'accessing' }
CMSquareShape >> extent [
    ^ size @ size
]

{ #category : 'accessing' }
CMSquareShape >> geometry [
    ^ BlSquareGeometry new
]
