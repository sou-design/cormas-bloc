Class {
	#name : 'CMPointyTopHexGrid',
	#superclass : 'CMHexagonGrid',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'building' }
CMPointyTopHexGrid >> build [

    | space w h dx dy |

    space := BlSpace new.
    space show.

    w := shapeSize x.
    h := shapeSize y.

    "--------------------------------"
    "SAFE CENTER-TO-CENTER SPACING"
    "--------------------------------"

    dx := w .  "tiny expansion fixes overlap"
    dy := (h * 0.75).

    1 to: rows do: [:row |

        1 to: columns do: [:col |

            | x y shape |

            x := (col - 1) * dx.
            y := (row - 1) * dy.

            (row odd) ifTrue: [
                x := x + (dx / 2)
            ].

            shape := CMPointyTopHexagonShape new
                size: shapeSize;
                position: x @ y;
                color: Color orange;
                borderColor: Color black;
                borderWidth: 1.

            space root addChild: shape element
        ].
    ].
]
