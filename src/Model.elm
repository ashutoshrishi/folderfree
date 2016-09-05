module Model exposing (Model, PageModels, initial)

import Routes exposing (Page)
import Views.Index as Index
import Component.NavBar as NavBar


type alias PageModels =
    { indexModel : Index.Model }



-- Init for all subviews


initPageModels : PageModels
initPageModels =
    { indexModel = Index.init }


initial : Model
initial =
    let
        ( navbar, navbarMsg ) = NavBar.init
    in
        Model Routes.defaultPage initPageModels navbar


type alias Model =
    { page : Page
    , pages : PageModels
    , header : NavBar.Model
    }



