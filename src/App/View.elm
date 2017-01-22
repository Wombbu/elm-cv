module App.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

import App.Types exposing (Msg(..), Model)

view : Model -> Html Msg
view model =
  div []
  [ button [onClick App.Types.LogModel] [text "Log model"]
  , button [onClick App.Types.AppendModel ] [text "Append to model"]
  , Html.map App.Types.ClickTextArea (model.renderFunction model.textArea)
  ]
