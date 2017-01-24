module SideBar.State exposing (..)

import List exposing (map)
import SideBar.Types exposing (..)
import TextArea.View.Java
import TextArea.Types


-- Init


init : List Model
init =
  [ Model "Java" False (initFiles ".java" TextArea.View.Java.view)
  , Model "Elm" True (initFiles ".elm" TextArea.View.Java.view)
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
