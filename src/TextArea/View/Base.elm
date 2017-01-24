module TextArea.View.Base exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
-- import Html.Events exposing (..)
import Tuple exposing (first, second)
import List exposing (map)

import TextArea.Types exposing (..)

view : SyntaxRenderFunc
view model =
  div []
  [
    h1 [] [Html.text "Base"]
  ]
