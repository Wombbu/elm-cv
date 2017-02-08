module App exposing (..)

import Html exposing (Html)
import App.Types exposing (Model, Msg)
import App.State as State
import App.View as View


main : Program Never Model Msg
main =
    Html.program
        { init = State.init
        , subscriptions = State.subscriptions
        , update = State.update
        , view = View.view
        }
