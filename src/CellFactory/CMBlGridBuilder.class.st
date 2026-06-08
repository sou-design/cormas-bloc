Class {
	#name : 'CMBlGridBuilder',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'shapeSize',
		'spacing',
		'neighborhood',
		'gridElement',
		'cellElements',
		'shapeExtent'
	],
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'examples' }
CMBlGridBuilder class >> example [

	| simulation grid |
	simulation := (CMSimulation for: ECECModel )
		activeInitSelector: #smallEnvironment  ;
		activeControlSelector: #step;
		initializeSimulation;
		yourself. 
	
	grid := self for: simulation cormasModel.
	grid buildPresenter open
]

{ #category : 'instance creation' }
CMBlGridBuilder class >> for: aCormasModel [
	
	^ self new
		cormasModel: aCormasModel;
		yourself
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> borderColorOfCell: aCell [

	^ (self povOfCell: aCell) borderColor
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> borderWidthOfCell: aCell [

	^ (self povOfCell: aCell) borderWidth
]

{ #category : 'building' }
CMBlGridBuilder >> buildPresenter [
	| spacePresenter space cellExtent lastCellPosition gridSize |
	
	cellElements := Dictionary new.
	neighborhood := self neighborhoodCount.
	
	cellExtent := (self cellElementClass new size: shapeSize; yourself) extent.
	
	lastCellPosition := 0.0 @ 0.0.
	1 to: self numberOfRows do: [ :row |
		1 to: self numberOfColumns do: [ :col |
			| pos |
			pos := self position: row col: col.
			lastCellPosition := (lastCellPosition x max: pos x) @ (lastCellPosition y max: pos y) ] ].
	
	gridSize := lastCellPosition + cellExtent.
	
	gridElement := BlElement new.
	gridElement layout: BlBasicLayout new.
	gridElement constraintsDo: [ :c |
		c horizontal exact: gridSize x.
		c vertical exact: gridSize y ].
	
	1 to: self numberOfRows do: [ :row |
		1 to: self numberOfColumns do: [ :col |
			| cell position shape el |
			cell := cormasModel cellAt: row at: col.
			position := self position: row col: col.
			shape := self cellElementClass new
				size: shapeSize;
				position: position;
				color: (self colorOfCell: cell);
				borderColor: (self borderColorOfCell: cell);
				borderWidth: (self borderWidthOfCell: cell) * shapeSize * 2;
				yourself.
			self setOrientation: row col: col shape: shape.
			el := shape element.
			el position: position.
			gridElement addChild: el.
			shapeExtent := cellExtent.
			cellElements at: row @ col put: el ] ].
	
	spacePresenter := SpBlSpaceInMorphPresenter new.
	space := spacePresenter space.
	space root layout: BlFrameLayout new.
	gridElement constraintsDo: [ :c |
		c frame vertical alignCenter.
		c frame horizontal alignCenter ].
	space root addChild: gridElement.
	^ spacePresenter
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> cellElementClass [
	Transcript showCr: 'neighborhood value: ' , neighborhood printString.
   neighborhood = 3 ifTrue: [ ^ CMTriangleShape ].
   neighborhood = 4 ifTrue: [ ^ CMSquareShape ].
   neighborhood = 6 ifTrue: [ ^ CMPointyTopHexagonShape ].
	neighborhood = #flat6 ifTrue: [ ^ CMFlatTopHexagonShape ].
	neighborhood = 8 ifTrue: [ ^ CMSquareShape ].
 
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> colorOfCell: aCell [

	^ (self povOfCell: aCell) color
]

{ #category : 'accessing' }
CMBlGridBuilder >> cormasModel: aCormasModel [

	cormasModel := aCormasModel
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> elementAtRow: row col: col [
	^ cellElements at: row @ col
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> elementForCell: aCell [

    ^ self
        elementAtRow: aCell rowNumber
        col: aCell columnNumber
]

{ #category : 'examples' }
CMBlGridBuilder >> example [
	<script: 'self example'>
]

{ #category : 'accessing' }
CMBlGridBuilder >> gridElement [
    ^ gridElement
]

{ #category : 'initialization' }
CMBlGridBuilder >> initialize [
   super initialize.
   shapeSize := 50.
   spacing := 0.

	
]

{ #category : 'accessing' }
CMBlGridBuilder >> neighborhood: aNumber [
	neighborhood := aNumber.
]

{ #category : 'accessing' }
CMBlGridBuilder >> neighborhoodCount [
    | name neighbours |
    name := cormasModel spaceModel neighbourhoodConfiguration class name.
    neighbours := (name select: [ :c | c isDigit ]) asInteger.
    (neighbours = 6 and: [ name includesSubstring: 'FlatTop' ]) ifTrue: [ ^ #flat6 ].
    ^ neighbours
]

{ #category : 'accessing' }
CMBlGridBuilder >> numberOfColumns [

	^ cormasModel spaceModel numberOfColumns
]

{ #category : 'accessing' }
CMBlGridBuilder >> numberOfRows [

	^ cormasModel spaceModel numberOfRows
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> position: aRow col: aCol [

	|x y step offsetX offsetY|

	x := y := step := offsetX := offsetY :=0.
    step := self step.
    neighborhood = 6 ifTrue: [
        offsetX := step x / 2.
    ].

    neighborhood = #flat6 ifTrue: [
        offsetY := step y / 2.
    ].

    x := (aCol - 1) * (step x + spacing).
    y := (aRow - 1) * (step y + spacing).

    neighborhood = 6 ifTrue: [
        (aRow even) ifTrue: [ x := x + offsetX ].
    ].

    neighborhood = #flat6 ifTrue: [
        (aCol even) ifTrue: [ y := y + offsetY ].
    ].
 	^ x @ y
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> povOfCell: aCell [

	^ aCell perform: aCell class activePovSelector
]

{ #category : 'as yet unclassified' }
CMBlGridBuilder >> setOrientation: aRow col: aCol shape: aShape [
	neighborhood = 3 ifTrue: [
								aShape orientation: ((aRow + aCol ) odd
								ifTrue: [ #top ]
								ifFalse: [ #bottom ]).
							].
]

{ #category : 'accessing' }
CMBlGridBuilder >> shapeExtent [
	^shapeExtent
]

{ #category : 'accessing' }
CMBlGridBuilder >> shapeSize [
	^shapeSize
]

{ #category : 'accessing' }
CMBlGridBuilder >> shapeSize: aNumber [
	shapeSize := aNumber.
]

{ #category : 'accessing' }
CMBlGridBuilder >> spacing: aNumber [
	spacing := aNumber.
]

{ #category : 'stepping' }
CMBlGridBuilder >> step [
    neighborhood = 3 ifTrue: [
        ^ (3 sqrt / 2) @ (3 / 2) * shapeSize
    ].

	(neighborhood = 4 or: [ neighborhood = 8 ]) ifTrue: [ ^ (1 @ 1) * shapeSize ].


    neighborhood = 6 ifTrue: [
        ^ (3 sqrt @ (3 / 2)) * shapeSize
    ].

    neighborhood = #flat6 ifTrue: [
        ^ ((3 / 2) @ (3 sqrt)) * shapeSize
    ].
]
