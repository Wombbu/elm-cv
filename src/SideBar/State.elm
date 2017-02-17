module SideBar.State exposing (..)

import List exposing (map)
import SideBar.Types exposing (..)
import Shared.Types exposing (Syntax(..), Info(..))


-- Init


init : List Model
init =
    [ Model "Java" True (initFiles ".java" Java) False
    , Model "Elm" False (initFiles ".elm" Elm) False
    ]


initFiles : String -> Syntax -> List SideBarFile
initFiles name syntax =
    [ SideBarFile ("Info" ++ name) False Nothing syntax General
    , SideBarFile ("Skills" ++ name) False Nothing syntax Skills
    , SideBarFile ("Employers" ++ name) False Nothing syntax Employers
    , SideBarFile ("Projects" ++ name) False Nothing syntax Projects
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
