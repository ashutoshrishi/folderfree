module Routes
    exposing
        ( Page(..)
        , toHash
        , hashParser
        , pageParser
        , defaultPage
        -- , routeNames
        , goErrorPage
        )


import String
import Navigation
import UrlParser exposing (Parser, format, oneOf, s, (</>), string)


{-| type representing different accessible pages which will load in the
index. -}
type Page
  = IndexPage
  | ErrorPage



{-| Default page to be displayed in the Index page. -}
defaultPage : Page
defaultPage =
  IndexPage
  


-- {-| Assoc list of Page -> human readable name. -}
-- routeNames : List ( Page, String )
-- routeNames =
--     [ ( BlogPage, "blog" )
--     , ( AboutPage, "about me" )
--     ]


{-| Convert the give [page] to it's corresponding url. -}
toHash : Page -> String
toHash page =
  case page of
    IndexPage ->
      "#home"
        
    ErrorPage ->
      "#error"

{-| Generate a parser which converts the url in [location] to the [Page] type
or fail.
-}
hashParser : Navigation.Location -> Result String Page
hashParser location =
  let
    hashed =
      (String.dropLeft 1 location.hash)
  in
    UrlParser.parse identity pageParser hashed


{-| Actual parser. -}
pageParser : Parser (Page -> a) a
pageParser =
  oneOf
  [ format IndexPage (s "home")
  , format ErrorPage (s "error")
  ]

----------------- HELPERS -------------------


goErrorPage : Cmd msg
goErrorPage =
  Navigation.newUrl (toHash ErrorPage)
