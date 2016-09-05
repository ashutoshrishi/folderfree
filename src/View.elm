module View exposing (view)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing ( class )
import Model exposing (Model, PageModels)
import Actions exposing (Msg(..))
import Routes exposing (Page(..))


-- Importing main views

import Views.Index as Index
import Component.NavBar as NavBar



-- View

{-| Main app view. -}
view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ App.map HeaderMsg <| NavBar.view model.header
        , viewPage model
        ]


{-| Generate the view for the current page. -}
viewPage : Model -> Html Msg
viewPage model =
    case model.page of
        IndexPage ->
            App.map IndexPageMsg
                <| Index.view model.pages.indexModel

        ErrorPage ->
            h1 [] [ text "404" ]
