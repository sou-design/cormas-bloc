Class {
	#name : 'CMSquareGrid',
	#superclass : 'CMGrid',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'instance creation' }
CMSquareGrid >> build [
    | space step diameter |

    space := BlSpace new.

    diameter := shapeSize * 2.
    step := diameter + spacing +(shapeSize/2).

    1 to: rows do: [:row |
        1 to: columns do: [:col |

            | position shape |

            position :=
                gridPosition +
                ((col - 1 * step) @ (row - 1 * step)).

            shape := CMSquareShape new
                size: diameter;
                position: position;
                color: Color gray;
                borderColor: Color black;
                borderWidth: 1.

            space root addChild: shape element
        ].
    ].

    space show.
]
