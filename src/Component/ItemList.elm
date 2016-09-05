module Component.ItemList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import List
import String
import Component.Item exposing (Item, filterItems)


-- Model


type alias Model =
    { items : List Item
    , displayedItems : List Item
    , filter : String
    , selected : Maybe Item
    }


init : Model
init =
    let
        items =
            [ { title = "Hello, World"
              , desc = "This is a sample description."
              , categories = [ "Self" ]
              }
            , { title = "A Very Important Document"
              , desc = "Contains important information."
              , categories = [ "Self", "University" ]
              }
            ]
    in
        Model items items "" Nothing



-- Update


type Msg
    = Filter String
    | Selected Item


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Filter str ->
            let
                oldItems =
                    model.items

                newItems =
                    if String.isEmpty (Debug.log "Input" str) then
                        oldItems
                    else
                        filterItems str oldItems
            in
                ( { model
                    | filter = str
                    , displayedItems = newItems
                  }
                , Cmd.none
                )

        Selected item ->
            ( { model | selected = Just item }
            , Cmd.none
            )



-- View


view : Model -> Html Msg
view model =
    let
        searchItem =
            li [ class "item-form" ]
                [ div [ class "search" ]
                    [ input
                        [ type' "text"
                        , placeholder "Filter Document List"
                        , onInput Filter
                        ]
                        []
                    ]
                ]
    in
        div [ class "item-list-column" ]
            [ div [ class "item-list-header" ]
                [ text "Document List" ]
            , ul [ class "item-list" ] <|
                searchItem
                    :: viewItemList model
            ]


viewItemList : Model -> List (Html Msg)
viewItemList model =
    List.map viewItem model.displayedItems


viewItem : Item -> Html Msg
viewItem item =
    let
        makeLabel s =
            span [ class "label" ]
                [ text s ]
    in
        li
        [ class "item-box"
        , onClick (Selected item)
        ]
        [ div [ class "item-title" ]
            [ text item.title ]
        , div [ class "item-category-row"]
            <| List.map makeLabel item.categories
        , div [ class "item-content" ]
            [ text item.desc ]
        ]

