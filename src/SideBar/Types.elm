module SideBar.Types exposing (..)

import TextArea.Types

type alias Model =
  { name : String
  , textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
  }

type Msg =
    Open
