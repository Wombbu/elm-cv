module Shared.Styles exposing (..)

import Css exposing (..)

import Html
import Html.Attributes


-- Colors


colorTextArea : Color
colorTextArea =
  rgb 45 48 55

colorSidebarBg : Color
colorSidebarBg =
  rgb 39 41 47

colorSidebarHilight : Color
colorSidebarHilight =
  rgb 49 52 61

colorTextMain : Color
colorTextMain =
  rgb 158 163 178

colorTextHilight : Color
colorTextHilight =
  rgb 215 217 223

colorBlue : Color
colorBlue =
  rgb 127 158 252



-- Translate mixins to native elm styles


styles : List Mixin -> Html.Attribute msg
styles =
  Css.asPairs >> Html.Attributes.style


-- Helpers


pickClass : a -> a -> Bool -> a
pickClass first second pickFirst =
  if pickFirst then
    first
  else
    second
