module SideBar.State exposing (..)

import List exposing (map)
import SideBar.Types exposing (..)
import Shared.Types exposing (Syntax(..))


-- Init


init : List Model
init =
    [ Model "Java" True (initFiles ".java") False
    , Model "Elm" False (initFiles ".elm") False
    ]


initFiles : String -> List SideBarFile
initFiles name =
    [ SideBarFile ("Info" ++ name) False Nothing Java
    , SideBarFile ("Skills" ++ name) False Nothing Elm
    ]



-- Helper functions


setFolderActiveWithName : String -> Model -> Model
setFolderActiveWithName name folder =
    if folder.folderName == name then
        { folder
            | active = True
        }
    else
        { folder
            | active = False
        }


toggleExpanded : String -> Model -> Model
toggleExpanded name folder =
    if folder.folderName == name then
        { folder
            | expanded = not folder.expanded
        }
    else
        folder


setFileActiveWithName : String -> Model -> Model
setFileActiveWithName name model =
    model |> goThroughAllFiles (setActive name)


goThroughAllFiles : (SideBarFile -> SideBarFile) -> Model -> Model
goThroughAllFiles function model =
    { model
        | files = model.files |> map function
    }


setActive : String -> SideBarFile -> SideBarFile
setActive withName file =
    if file.name == withName then
        { file
            | active = True
        }
    else
        { file
            | active = False
        }
