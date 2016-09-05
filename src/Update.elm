module Update exposing ( update )

import Model exposing ( Model )
import Actions exposing ( Msg(..) )
import Component.NavBar as NavBar
import Views.Index as Index

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        HeaderMsg m ->
            let
                ( newModel, newMsg ) = NavBar.update m model.header
            in
                ( { model | header = newModel }
                , Cmd.map HeaderMsg newMsg
                )

        IndexPageMsg m ->
            let
                (newmodel, newmsg) = Index.update m model.pages.indexModel
                pages = model.pages
                newPages = { pages | indexModel = newmodel }
            in
                ( { model | pages = newPages }
                , Cmd.map IndexPageMsg newmsg
                )
