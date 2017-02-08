module SideBar.Types exposing (..)

import TextArea.Types
import TabBar.Types


type alias Model =
    { folderName : String
    , expanded : Bool
    , files : List SideBarFile
    , active : Bool
    }


type alias SideBarFile =
    { name : String
    , textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
    , active : Bool
    }


type Msg
    = Open TabBar.Types.Model
    | ToggleFolder String
