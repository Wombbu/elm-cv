module TextArea.Styles exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Html
import Shared.Styles exposing (..)


-- Styles


-- TODO
-- Padding
-- Text base color
-- Hilights
-- Row spacing
-- Comment style
-- Font


type Classes =
  TextWrapper


css : Css.Stylesheet
css =
  ( stylesheet << namespace "text-area")
  [ (.) TextWrapper
    [ backgroundColor colorTextArea
    ,  indentMixin 2
    ]
  ]


-- Helpers


fontSize : Float
fontSize =
  12


indentMixin : Float -> Css.Mixin
indentMixin spaces =
  paddingLeft (pt (spaces * fontSize))



indent : Float -> Html.Attribute msg
indent spaces =
  styles [paddingLeft (pt (spaces * fontSize))]
