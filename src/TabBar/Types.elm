module TabBar.Types exposing (..)

import TextArea.Types
import Requests.Types


type alias Model =
    { textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
    , text : String
    , active : Bool
    , textAreaModel : TextArea.Types.Model
    , cvModel : Maybe Requests.Types.CvData
    }


type Msg
    = Open Model
    | Close String
