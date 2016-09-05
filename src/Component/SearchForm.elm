module Component.SearchForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import FlexboxGrid.Html as Flex


-- Model


type alias Model =
    { searchInput : String }


init : ( Model, Cmd Msg )
init =
    ( Model ""
    , Cmd.none
    )



-- Update


type Msg
    = Input String
    | Submit


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input str ->
            ( { model | searchInput = str }
            , Cmd.none
            )

        Submit ->
            ( model
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div [ class "search" ]
        [ Flex.rowMiddle_
            [ Flex.colXs' [ "search-text" ]
                [ input
                    [ type' "text"
                    , onInput Input
                    ]
                    []
                ]
            -- , Flex.colXs' [ "search-button" ]
            --     [ button
            --         [ class "btn btn-green"
            --         , onClick Submit
            --         ]
            --         [ text "Search" ]
            --     ]
            ]
        ]
