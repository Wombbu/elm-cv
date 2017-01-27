module TextArea.View.Base exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Html.CssHelpers
import TextArea.Styles exposing (Classes(..), indent)
import Css exposing (..)

import TextArea.Types exposing (..)

view : SyntaxRenderFunc
view model =
  div [ class [ TextWrapper ]]
  [
    p [ indent 2 ] [Html.text "Base"]
  ]


-- Styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


colorText : Color
colorText =
  rgb 61 64 72
