module SideBar.Types exposing (..)

import TextArea.Types

type alias Model =
  { name : String
  , file : TextArea.Types.Model
  }


type Msg =
    Open
