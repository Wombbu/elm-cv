module SideBar.State exposing (..)

import List exposing (map)
import SideBar.Types exposing (..)
import TextArea.View.Java
import TextArea.View.Elm
import TextArea.Types


-- Init


init : List Model
init =
  [ Model "Java" False (initFiles ".java" TextArea.View.Java.view)
  , Model "Elm" True (initFiles ".elm" TextArea.View.Elm.view)
  ]


initFiles : String -> TextArea.Types.SyntaxRenderFunc -> List SideBarFile
initFiles name syntax =
  [ SideBarFile  ("Info" ++ name) syntax False
  , SideBarFile ("Skills" ++ name) syntax False
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
    model
  )


setFileActiveWithName : String -> Model -> Model
setFileActiveWithName name model =
  model |> goThroughAllFiles (setActive name)


goThroughAllFiles : (SideBarFile -> SideBarFile) -> Model -> Model
goThroughAllFiles function model =
  { model |
    files = model.files |> map function
  }


setActive : String -> SideBarFile -> SideBarFile
setActive withName file =
  if file.name == withName then
      { file |
       active = True
      }
  else
    { file |
     active = False
    }
