{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
module Main where

import Data.Text
import Servant.API


main :: IO ()
main = putStrLn "Hello, Haskell!"


type UserAPI = "users" :> QueryParam "sortby" SortBy :> Get '[JSON] [User]


data SortBy = Age | Name

data User = User
    { name :: String
    , age :: Int
    }
