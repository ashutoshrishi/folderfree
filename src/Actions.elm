module Actions exposing (Msg(..))

import Routes exposing (Page)
import Views.Index as Index
import Component.NavBar as NavBar


type Msg
    = HeaderMsg NavBar.Msg
      -- * Page messages
    | IndexPageMsg Index.Msg
