module Shared.Styles exposing (..)

import Css exposing (..)

import Html
import Html.Attributes


-- Colors


colorTextArea : Color
colorTextArea =
  rgb 40 44 52

colorSidebarBg : Color
colorSidebarBg =
  rgb 33 37 43

colorSidebarHilight : Color
colorSidebarHilight =
  rgb 44 49 58

colorSidebarTextMain : Color
colorSidebarTextMain =
  rgb 157 165 180

colorTextMain : Color
colorTextMain =
  rgb 171 178 191

colorTextHilight : Color
colorTextHilight =
  rgb 215 218 224

colorBlue : Color
colorBlue =
  rgb 97 175 239

colorBorder : Color
colorBorder =
  rgb 24 26 31

colorTabText : Color
colorTabText =
  rgb 107 113 126

colorTabTextHilight : Color
colorTabTextHilight =
  rgb 215 218 224


-- Values


borderWidth : Float
borderWidth =
  1.5


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


-- Not in elm-css


concatParameters : List a -> String -> String
concatParameters list unit =
  Debug.log "muna" (List.foldl (\a b -> b ++ toString a ++ unit ++ " ") "" list)


userSelectNone : Mixin
userSelectNone  =
    property "userSelect" <| "none"

customBorder : List Float -> Mixin
customBorder list =
    property "border-width" <| concatParameters list "px"


justifyContentSpaceBetween : Mixin
justifyContentSpaceBetween  =
  property "justify-content" <| "space-between"


zIndex : Int ->  Mixin
zIndex index  =
    property "z-index" <| ( toString index )
