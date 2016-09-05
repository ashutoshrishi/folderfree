module Main exposing (..)

import Actions exposing (Msg)
import Model exposing (Model, initial)
import Navigation
import Routes exposing (Page)
import Update
import View

main : Program Never
main =
    Navigation.program (Navigation.makeParser Routes.hashParser)
        { init = init
        , view = View.view
        , update = Update.update
        , urlUpdate = urlUpdate
        , subscriptions = subscriptions
        }



-- Init


init : Result String Page -> ( Model, Cmd Msg )
init result =
    urlUpdate result initial



-- Url handler


urlUpdate : Result String Page -> Model -> ( Model, Cmd Msg )
urlUpdate result model =
    case Debug.log "parser" result of
        Err err ->
            ( model
            , Navigation.modifyUrl (Routes.toHash model.page)
            )

        Ok page ->
            ( { model | page = page }
            , Cmd.none
            )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
