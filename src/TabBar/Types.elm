module TabBar.Types exposing (..)

import Shared.Types


type alias Model =
    { text : String
    , active : Bool
    , cvModel : Maybe Shared.Types.CvData
    , syntax : Shared.Types.Syntax
    , info : Shared.Types.Info
    }


type Msg
    = Open Model
    | Close String
