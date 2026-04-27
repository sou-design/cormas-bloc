Class {
	#name : 'CMTriangleGrid',
	#superclass : 'CMGrid',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'instance creation' }
CMTriangleGrid >> build [

   " | space stepX stepY offset |

    space := BlSpace new.
    space show.

    ""empirical geometry based on your working version""
    stepX := size.
    stepY := size * 2.

    1 to: rows do: [:row |
        1 to: columns do: [:col |

            | x y orientation shape offsetX |

            

            x := (col - 1) * stepX.
            y := (row - 1) * stepY.

            orientation :=
                ((row + col) odd)
                    ifTrue: [ #top ]
                    ifFalse: [ #bottom ].

            shape := CMTriangleShape new
                size: size;
                color: Color orange;
                position: x @ y;
                borderColor: Color black;
                borderWidth: 1;
                orientation: orientation.

            space root addChild: shape element
        ].
    ]."


    | space stepX stepY |

    space := BlSpace new.
    space show.

    "your working spacing"
    stepX := shapeSize.
    stepY := shapeSize * 2.

    1 to: rows do: [:row |
        1 to: columns do: [:col |

            | x y orientation shape |

            x := gridPosition x + (col - 1) * stepX.
            y := gridPosition y + (row - 1) * stepY.

            orientation :=
                ((row + col) odd)
                    ifTrue: [ #top ]
                    ifFalse: [ #bottom ].

            shape := CMTriangleShape new
                size: shapeSize;
                color: Color orange;
                position: x @ y;
                borderColor: Color black;
                borderWidth: 1;
                orientation: orientation.

            space root addChild: shape element
        ].
    ].
]
