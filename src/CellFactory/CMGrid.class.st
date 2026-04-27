Class {
	#name : 'CMGrid',
	#superclass : 'Object',
	#instVars : [
		'rows',
		'columns',
		'shapeSize',
		'gridPosition',
		'spacing'
	],
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'accessing' }
CMGrid >> columns: anInteger [
	columns := anInteger 
]

{ #category : 'accessing' }
CMGrid >> gridPosition: aPoint [
	gridPosition:=aPoint 
]

{ #category : 'initialization' }
CMGrid >> initialize [
    super initialize.
    rows := 10.
    columns := 10.
    shapeSize := 20.
	 gridPosition := 0@0.
    spacing := 2.
]

{ #category : 'accessing' }
CMGrid >> rows: anInteger [
	rows := anInteger 
]

{ #category : 'accessing' }
CMGrid >> shapeSize: aNumber [
	shapeSize := aNumber 
]

{ #category : 'host space - displaying' }
CMGrid >> show [
    | space |
    space := BlSpace new.
    space root addChild: self element.
    space show.
]

{ #category : 'accessing' }
CMGrid >> spacing: aNumber [
	spacing := aNumber 
]
