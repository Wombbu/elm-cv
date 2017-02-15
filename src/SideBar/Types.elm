module SideBar.Types exposing (..)

import TabBar.Types
import Shared.Types
import Shared.Types exposing (CvData)


type alias Model =
    { folderName : String
    , expanded : Bool
    , files : List SideBarFile
    , active : Bool
    }


type alias SideBarFile =
    { name : String
    , active : Bool
    , cvData : Maybe CvData
    , syntax : Shared.Types.Syntax
    }


type Msg
    = Open TabBar.Types.Model
    | ToggleFolder String
