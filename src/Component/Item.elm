module Component.Item exposing (Item, filterItems)


import String
import List


type alias Item =
    { title      : String
    , desc       : String
    , categories : List String
    }





-- Utility functions


{-| Filter the list of `items`, keeping every item whose title and description
contain the phrase `term`.
-}
filterItems : String -> List Item -> List Item
filterItems term items =
    let
        hasTerm item =
            String.contains term <|
                String.toLower <|
                    String.join " "
                        [ item.title
                        , item.desc
                        ]
    in
        List.filter hasTerm items
    
