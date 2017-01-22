module TabBar.Types exposing (..)

import TextArea.Types

type alias Model =
  { file : TextArea.Types.Model
  , text : String
  }

type Msg =
    Open
