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


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ShowItem item ->
            ( { model | displayItem = Just item }
            , Cmd.none
            )

-- view

view : Model -> Html Msg
view model =
    div [ class "item-display" ]
        [ text <| toString model.displayItem ]

