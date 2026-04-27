Class {
	#name : 'CMBlGrid',
	#superclass : 'Object',
	#instVars : [
		'cormasModel'
	],
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'instance creation' }
CMBlGrid class >> for: aCormasModel [
	
	^ self new
		cormasModel: aCormasModel;
		yourself
]

{ #category : 'as yet unclassified' }
CMBlGrid >> borderColorOfCell: aCell [

	^ (self povOfCell: aCell) borderColor
]

{ #category : 'as yet unclassified' }
CMBlGrid >> borderWidthOfCell: aCell [

	^ (self povOfCell: aCell) borderWidth
]

{ #category : 'building' }
CMBlGrid >> buildPresenter [
	
	| shapeSize spacing diameter step spacePresenter space |
	
	shapeSize := 50.
	spacing := 0.

	diameter := shapeSize * 2.
	step := diameter + spacing.
	
	spacePresenter := SpBlSpaceInMorphPresenter new.
	space := spacePresenter space.

	1 to: self numberOfRows do: [ :row |
		1 to: self numberOfColumns do: [ :col |
			| cell position shape |
			cell := cormasModel cellAt: row at: col.
			
			position := ((row - 1) * step) @ ((col - 1) * step).

 			shape := self cellElementClass new
				size: diameter;
				position: position;
 				color: (self colorOfCell: cell);
				borderColor: (self borderColorOfCell: cell);
				borderWidth: (self borderWidthOfCell: cell) * diameter;
				yourself.

			space root addChild: shape element ] ].

	^ spacePresenter
]

{ #category : 'as yet unclassified' }
CMBlGrid >> cellElementClass [

	^ CMSquareShape
]

{ #category : 'as yet unclassified' }
CMBlGrid >> colorOfCell: aCell [

	^ (self povOfCell: aCell) color
]

{ #category : 'accessing' }
CMBlGrid >> cormasModel: aCormasModel [

	cormasModel := aCormasModel
]

{ #category : 'accessing' }
CMBlGrid >> numberOfColumns [

	^ cormasModel spaceModel numberOfColumns
]

{ #category : 'accessing' }
CMBlGrid >> numberOfRows [

	^ cormasModel spaceModel numberOfRows
]

{ #category : 'as yet unclassified' }
CMBlGrid >> povOfCell: aCell [

	^ aCell perform: aCell class activePovSelector
]
