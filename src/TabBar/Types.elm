module TabBar.Types exposing (..)

import TextArea.Types

type alias Model =
  { textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
  , text : String
  , active : Bool
  , textAreaModel : TextArea.Types.Model
  }

type Msg =
    Open (Model)
    | Close String
