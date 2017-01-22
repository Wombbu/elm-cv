module SideBar.View exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Events exposing (..)

import SideBar.Types

java : TextArea.Types.Model -> Html TextArea.Types.Msg
java model =
  div []
  [ h1 [onClick SideBar.Types.Open] [ text "Sidebar" ]
  ]
