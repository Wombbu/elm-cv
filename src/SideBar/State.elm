module SideBar.State exposing (..)

import SideBar.Types exposing (..)
import TextArea.View


-- Init


init : List Model
init =
  [ Model "Java" (initFiles ".java")
  , Model "Elm" (initFiles ".elm")
  ]

initFiles : String -> List SideBarFile
initFiles name =
  [ SideBarFile  ("Info" ++ name) TextArea.View.java
  , SideBarFile ("Skills" ++ name) TextArea.View.java
  ]
