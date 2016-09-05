module Component.ItemList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import FlexboxGrid.Html as Flex
import List
import String
import Component.Item exposing (Item, filterItems, Tag(..))


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
              , tags = [ CustomTag "Self" ]
              }
            , { title = "A Very Important Document"
              , desc = "Contains important information."
              , tags = [ CustomTag "Self", CustomTag "University" ]
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
                [ Flex.row_
                    [ Flex.colXs_ [ text "Document List" ]
                    , Flex.colXs_
                        [ div [ style [ ( "text-align", "right" ) ] ]
                            [ text "Showing All Tags" ]
                        ]
                    ]
                ]
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
            case s of
                All ->
                    span [] []

                CustomTag s ->
                    span [ class "label" ]
                        [ text s ]
    in
        li
            [ class "item-box"
            , onClick (Selected item)
            ]
            [ div [ class "item-title" ]
                [ text item.title ]
            , div [ class "item-category-row" ] <|
                List.map makeLabel item.tags
            , div [ class "item-content" ]
                [ text item.desc ]
            ]
