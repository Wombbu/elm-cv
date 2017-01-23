module SideBar.View exposing (..)

import Html exposing (Html, div, p)
import Html.Events exposing (onClick)

import Css exposing (..)
import Shared.Styles exposing (styles)

import SideBar.Types


-- Html


view : List SideBar.Types.Model -> Html SideBar.Types.Msg
view model =
  div [styleSidebarEntry, onClick SideBar.Types.Open]
  [
    p [] [ Html.text "Sidebar entry" ]
  ]


-- Styles


styleSidebarEntry : Html.Attribute msg
styleSidebarEntry =
  styles
    [ backgroundColor ( Shared.Styles.colorHighlight )
    , overflowX hidden
    , overflowY hidden
    , height ( px 40)
    ]
