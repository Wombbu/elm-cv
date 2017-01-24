module TextArea.View.Base exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Shared.Styles exposing (..)
import Css exposing (..)

import TextArea.Types exposing (..)

view : SyntaxRenderFunc
view model =
  div [styles [ backgroundColor colorSidebarBg] ]
  [
    h1 [ styles [ color colorText]] [Html.text "Base"]
  ]


-- Styles


colorText : Color
colorText =
  rgb 61 64 72
