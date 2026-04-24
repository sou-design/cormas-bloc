Class {
	#name : 'CMFlatTopHexGrid',
	#superclass : 'CMHexagonGrid',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'building' }
CMFlatTopHexGrid >> build [

    | space w h |

    space := BlSpace new.
    space show.

    w := shapeSize x.
    h := shapeSize y.

    1 to: rows do: [:row |

        1 to: columns do: [:col |

            | x y shape |

            "-----------------------------"
            "BASE HEX GRID POSITION"
            "-----------------------------"

            x := (col - 1) * (w * 0.75).
            y := (row - 1) * (h * 0.86602540378).

            "-----------------------------"
            "STAGGER (honeycomb shift)"
            "-----------------------------"

            (col odd) ifTrue: [
                y := y + (h * 0.46)
            ].

            "-----------------------------"
            "CREATE HEX SHAPE"
            "-----------------------------"

            shape := CMFlatTopHexagonShape new
                size: shapeSize;
                position: x @ y;
                color: Color orange;
                borderColor: Color black;
                borderWidth: 1.

            "-----------------------------"
            "ADD TO SCENE"
            "-----------------------------"

            space root addChild: shape element
        ].
    ].
]
