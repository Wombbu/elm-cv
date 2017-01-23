module SideBar.Types exposing (..)

import TextArea.Types

type alias Model =
  { folderName: String
  , files: List SideBarFile 
  }

type alias SideBarFile =
  { name : String
  , textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
  }

type Msg =
    Open
