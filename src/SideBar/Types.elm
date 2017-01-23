module SideBar.Types exposing (..)

import TextArea.Types
import TabBar.Types

type alias Model =
  { folderName: String
  , files: List SideBarFile
  }

type alias SideBarFile =
  { name : String
  , textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
  }

type Msg =
    Open TabBar.Types.Model
    | ToggleFolder
