Class {
	#name : 'CMHexagonGrid',
	#superclass : 'CMGrid',
	#instVars : [
		'orientation'
	],
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'initialization' }
CMHexagonGrid >> initialize [

    super initialize.
    orientation := #flatTop. 
]

{ #category : 'accessing' }
CMHexagonGrid >> orientation: aSymbol [
	orientation := aSymbol 
]
