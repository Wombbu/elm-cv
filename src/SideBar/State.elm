module SideBar.State exposing (..)

import List exposing (map)
import SideBar.Types exposing (..)
import TextArea.View


-- Init


init : List Model
init =
  [ Model "Java" False (initFiles ".java")
  , Model "Elm" True (initFiles ".elm")
  ]

initFiles : String -> List SideBarFile
initFiles name =
  [ SideBarFile  ("Info" ++ name) TextArea.View.java
  , SideBarFile ("Skills" ++ name) TextArea.View.java
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
