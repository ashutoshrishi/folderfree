module Component.ItemDisplay exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Component.Item exposing (Item)


-- model


type alias Model =
    { displayItem : Maybe Item }


init : Model
init =
    Model Nothing



-- update


type Msg
    = ShowItem Item


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShowItem item ->
            ( { model | displayItem = Just item }
            , Cmd.none
            )



-- view


view : Model -> Html Msg
view model =
    let
        itemHeader =
            case model.displayItem of
                Nothing ->
                    [ div [ class "item-display-title" ]
                        [ text "No Item Selected." ]
                    ]

                Just item ->
                    [ div [ class "item-display-title" ]
                        [ text item.title ]
                    , div [ class "item-display-desc" ]
                        [ text item.desc ]
                    ]
    in
        div [ class "item-display" ]
            [ div [ class "item-display-header" ]
                itemHeader
            ]
