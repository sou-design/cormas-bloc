Class {
	#name : 'CMFlatTopHexagonShape',
	#superclass : 'CMHexagonShape',
	#category : 'CellFactory',
	#package : 'CellFactory'
}

{ #category : 'accessing' }
CMFlatTopHexagonShape >> geometry [

    | w h left right topLeft topRight |

    w := size x.
    h := size y.

    "top"
    topLeft  := (w * 0.25 @ 0).
    topRight := (w * 0.75 @ 0).

    left := {
        (0 @ (h / 2)).         
        (w * 0.25 @ h)          
    }.


    right := left collect: [:p |
        (w - p x) @ p y
    ].

    ^ BlPolygonGeometry vertices:
        { topLeft. topRight } , right , left reversed
]
