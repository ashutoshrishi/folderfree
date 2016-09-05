module Component.NavBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import FlexboxGrid.Html as Flex
import List
import Routes exposing (Page)


-- Model


type alias Model =
    { activePage : Page }


init : ( Model, Cmd Msg )
init =
    ( Model Routes.defaultPage
    , Cmd.none
    )



-- Update


type Msg
    = NoMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    let
        links =
            [ ( "Home", "#", "folder-o" )
            , ( "About", "#", "gears" )
            ]
    in
        navbar
            [ navbarNav links ]



-- Html helpers


navbar : List (Html msg) -> Html msg
navbar inner =
    div [ class "navbar" ]
        [ Flex.rowMiddle_ inner ]



navbarNav : List ( String, String, String ) -> Html msg
navbarNav links =
    let
        makeLink ( name, to, font ) =
            li []
                [ a [ href to ]
                    [ i [ class <| "fa fa-" ++ font ] []
                    , text name
                    ]
                ]
    in
        Flex.col_ 12
            6
            6
            [ ul [ class "navbar-nav" ] <|
                List.map makeLink links
            ]


navbarItem : List (Html msg) -> Html msg
navbarItem inner =
    Flex.colXs'
        [ "navbar-item" ]
        inner
