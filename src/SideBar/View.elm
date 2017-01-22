module SideBar.View exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Events exposing (..)

import SideBar.Types

java : SideBar.Types.Model -> Html SideBar.Types.Msg
java model =
  div []
  [ h1 [onClick SideBar.Types.Open] [ text "Sidebar" ]
  ]
