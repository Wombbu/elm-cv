module TextArea.View exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Events exposing (..)

import TextArea.Types

java : TextArea.Types.Model -> Html TextArea.Types.Msg
java model =
  div []
  [ h1 [onClick TextArea.Types.Click] [ text "Java" ]
  ]
