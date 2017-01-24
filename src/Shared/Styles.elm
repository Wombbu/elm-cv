module Shared.Styles exposing (..)

import Css exposing (..)

import Html
import Html.Attributes


-- Colors


colorMain : Color
colorMain =
  hex "#333c37"

colorHighlight : Color
colorHighlight =
  hex "#fff"

colorTextArea : Color
colorTextArea =
  rgb 30 33 39

colorSidebarBg : Color
colorSidebarBg =
  rgb 25 28 32

colorSidebarHilight : Color
colorSidebarHilight =
  rgb 33 36 44

colorTextMain : Color
colorTextMain =
  rgb 139 147 164

colorTextHilight : Color
colorTextHilight =
  rgb 204 208 216

colorBlue : Color
colorBlue =
  rgb 94 138 255



-- Translate mixins to native elm styles


styles : List Mixin -> Html.Attribute msg
styles =
  Css.asPairs >> Html.Attributes.style
