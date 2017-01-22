module TabBar.View exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Events exposing (..)

import TabBar.Types

view : TabBar.Types.Model -> Html TabBar.Types.Msg
view model =
  div []
  [ h1 [onClick TabBar.Types.Open] [ text "Java" ]
  ]
