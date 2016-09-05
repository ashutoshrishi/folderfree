module FlexboxGrid.Html exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String exposing (join)


divWithClass : List String -> List (Html msg) -> Html msg
divWithClass classes =
    div [ class <| join " " classes ]
        



-- * Containers


containerFluid_ : List (Html msg) -> Html msg
containerFluid_ =
    divWithClass [ "container-fluid" ]


containerFluid' : List String -> List (Html msg) -> Html msg
containerFluid' classes =
    divWithClass <| "container-fluid" :: classes


container_ : List (Html msg) -> Html msg
container_ =
    divWithClass [ "container" ]



-- * Row


row_ : List (Html msg) -> Html msg
row_ =
    divWithClass [ "row" ]


row' : List String -> List (Html msg) -> Html msg
row' classes =
    divWithClass <| "row" :: classes


rowStart_ : List (Html msg) -> Html msg
rowStart_ =
    divWithClass [ "row", "start-xs" ]


rowCenter_ : List (Html msg) -> Html msg
rowCenter_ =
    divWithClass [ "row", "center-xs" ]


rowEnd_ : List (Html msg) -> Html msg
rowEnd_ =
    divWithClass [ "row", "end-xs" ]


rowTop_ : List (Html msg) -> Html msg
rowTop_ =
    divWithClass [ "row", "top-xs" ]


rowMiddle_ : List (Html msg) -> Html msg
rowMiddle_ =
    divWithClass [ "row", "middle-xs" ]



-- * Col


col_ : Int -> Int -> Int -> List (Html msg) -> Html msg
col_ xs md lg =
    divWithClass
        [ "col-xs-" ++ toString xs
        , "col-md-" ++ toString md
        , "col-lg-" ++ toString lg
        ]

col' : Int -> Int -> Int -> List String -> List (Html msg) -> Html msg
col' xs md lg classes =
    divWithClass <|
        [ "col-xs-" ++ toString xs
        , "col-md-" ++ toString md
        , "col-lg-" ++ toString lg
        ] ++ classes 
        

colXs_ : List (Html msg) -> Html msg
colXs_ =
    divWithClass [ "col-xs" ]


colXs' : List String -> List (Html msg) -> Html msg
colXs' classes =
    divWithClass <| "col-xs" :: classes
