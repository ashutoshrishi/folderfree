# FOLDER FREE (tentative)

*Keeping scans of important documents of your life backed up and organised for
quick access wherever needed.*

Folder Free is a web app which can help organise important documents
collected/received over a lifetime. From school documents to other personal
documents, it is often handy to have their scans ready for any online
application submission. This app would keep all of these scans a query away and
provide features to organise a subset of scans for any online application
process whenever needed. Quite simply, it can serve as an online backup of
important documents, which should absolutely be a done for anything important.


Folder Free provides an interface exposing a combination of the above features,
over a trusted external store of documents. A private user Dropbox account is
an example of such a store. Flexibility of changing stores should be allowed.

Ultimately this is a side project testing [Elm](http://elm-lang.org/) in
designing a web UI and interacting with an backend API.


## Building

**Frontend**

Compile the Elm sources into a single JS file `elm.js` in the root of the
project folder.

    elm make src/Main.elm --output=elm.js
    
**Backend**

Will be tracked soon in a sub-folder.

<!-- The backend web-server is written in Haskell -->
<!-- using [Servant](https://hackage.haskell.org/package/servant). -->

<!--     cd backend/ -->
<!--     cabal configure -->
<!--     cabal build -->
    
