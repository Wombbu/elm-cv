module TabBar.Types exposing (..)

import TextArea.Types
import Requests.Types
import Shared.Types


type alias Model =
    { textAreaRenderFunc : TextArea.Types.SyntaxRenderFunc
    , text : String
    , active : Bool
    , textAreaModel : TextArea.Types.Model
    , cvModel : Maybe Requests.Types.CvData
    , syntax : Shared.Types.Syntax
    }


type Msg
    = Open Model
    | Close String
