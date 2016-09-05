module Views.Index exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import FlexboxGrid.Html exposing (..)
import Component.ItemList as ItemList
import Component.ItemDisplay as ItemDisplay


-- Model


type alias Model =
    { leftList : ItemList.Model
    , display : ItemDisplay.Model
    }


init : Model
init =
    Model ItemList.init ItemDisplay.init



-- Update


type Msg
    = ItemListMsg ItemList.Msg
    | ItemDisplayMsg ItemDisplay.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ItemListMsg (ItemList.Selected i) ->
            let
                oldDisplay = model.display
                newDisplay = {oldDisplay | displayItem = Just i}
            in
            ( { model | display = newDisplay }
            , Cmd.none
            )
        
        ItemListMsg m ->
            let
                ( newModel, newMsg ) =
                    ItemList.update m model.leftList
            in
                ( { model | leftList = newModel }
                , Cmd.map ItemListMsg newMsg
                )

        ItemDisplayMsg m ->
            let
                ( newModel, newMsg ) =
                    ItemDisplay.update m model.display
            in
                ( { model | display = newModel }
                , Cmd.map ItemDisplayMsg newMsg
                )



-- View


view : Model -> Html Msg
view model =
    div [ class "page" ]
        [ row' [ "full-row" ]
            [ col_ 12
                4
                4
                [ App.map ItemListMsg <| ItemList.view model.leftList ]
            , col_ 12
                8
                8
                [ App.map ItemDisplayMsg <|
                    ItemDisplay.view model.display
                ]
            ]
        ]
