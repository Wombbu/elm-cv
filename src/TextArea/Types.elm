module TextArea.Types exposing (..)

import Html exposing (Html)
import Shared.Types


type Msg
    = Click


type alias SyntaxRenderFunc =
    Shared.Types.CvData -> Html Msg
