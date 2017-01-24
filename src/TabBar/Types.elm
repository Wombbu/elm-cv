module TabBar.Types exposing (..)

import TextArea.Types

type alias Model =
  { textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
  , text : String
  }

type Msg =
    Open TextArea.Types.SyntaxRenderFunc
    | Close String
