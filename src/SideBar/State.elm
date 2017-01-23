module SideBar.State exposing (..)

import List exposing (map)
import SideBar.Types exposing (..)
import TextArea.View
import TextArea.Types


-- Init


init : List Model
init =
  [ Model "Java" False (initFiles ".java" TextArea.View.java)
  , Model "Elm" True (initFiles ".elm" TextArea.View.elm)
  ]

initFiles : String -> TextArea.Types.SyntaxRenderFunc -> List SideBarFile
initFiles name syntax =
  [ SideBarFile  ("Info" ++ name) syntax
  , SideBarFile ("Skills" ++ name) syntax
  ]


-- Helper functions

toggleExpanded : String -> List Model -> List Model
toggleExpanded name model =
  (map (\folder ->
      if folder.folderName == name then
          { folder
          | expanded = not folder.expanded
          }
      else
        folder
      )
    model)
