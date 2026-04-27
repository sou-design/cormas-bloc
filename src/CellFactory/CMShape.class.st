Class {
	#name : 'CMShape',
	#superclass : 'Object',
	#instVars : [
		'size',
		'color',
		'position',
		'borderColor',
		'borderWidth'
	],
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'accessing' }
CMShape >> borderColor: aBorderColor [
    borderColor := aBorderColor
]

{ #category : 'accessing' }
CMShape >> borderWidth: aBorderWidth [
    borderWidth := aBorderWidth
]

{ #category : 'accessing' }
CMShape >> color: aColor [
    color := aColor
]

{ #category : 'accessing' }
CMShape >> element [
    | cell |
    cell := BlElement new
        extent: self extent; 
        background: color;
        position: position;
        border: (BlBorder paint: borderColor width: borderWidth).

    cell geometry: self geometry.
    ^ cell
]

{ #category : 'accessing' }
CMShape >> extent [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMShape >> geometry [
    self subclassResponsibility
]

{ #category : 'initialization' }
CMShape >> initialize [
    super initialize.
    size := 60.
    color := Color gray.
    position := 0@0.
    borderColor := Color black.
    borderWidth := 1.
]

{ #category : 'accessing' }
CMShape >> position: aPoint [
    position := aPoint
]

{ #category : 'host space - displaying' }
CMShape >> show [
	| spacePresenter element space |
	spacePresenter := SpBlSpaceInMorphPresenter new.
	space := spacePresenter space.
	space root layout: BlFrameLayout new.
	
	element := self element.
	
	element constraintsDo: [ :c |
		c frame vertical alignCenter.
		c frame horizontal alignCenter ].
		
	space root addChild: element.
	spacePresenter open.
]

{ #category : 'accessing' }
CMShape >> size: aNumber [
    size := aNumber 
]

{ #category : 'as yet unclassified' }
CMShape >> topLeftPosition [
    ^ position - (self extent / 2)
]
