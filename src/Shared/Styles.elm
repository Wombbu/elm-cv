module Shared.Styles exposing (..)

import Css exposing (..)

import Html
import Html.Attributes


-- Colors


colorMain: Color
colorMain =
  hex "#333c37"

colorHighlight: Color
colorHighlight =
  hex "#999c97"


-- Translate mixins to native elm styles


styles : List Mixin -> Html.Attribute msg
styles =
  Css.asPairs >> Html.Attributes.style
