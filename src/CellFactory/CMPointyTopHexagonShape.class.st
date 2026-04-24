Class {
	#name : 'CMPointyTopHexagonShape',
	#superclass : 'CMHexagonShape',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'accessing' }
CMPointyTopHexagonShape >> geometry [

    | w h left right |

    w := size x.
    h := size y.

    "build left side"
    left := {
        (0 @ (h * 0.25)).
        (0 @ (h * 0.75)).
        (w / 2 @ h)
    }.

    "build right side (mirror)"
    right := left collect: [:p |
        (w - p x) @ p y
    ].

    ^ BlPolygonGeometry vertices:
        { (w / 2 @ 0) } , right , left reversed
]
