module App.View exposing (..)

import Html exposing (Html, div, button)
import Css exposing (..)
import Shared.Styles exposing (..)

import App.Types exposing (Msg(..), Model)

import SideBar.View
import TabBar.View


view : Model -> Html Msg
view model =
  div [styleAppContainer]
  [
    div [ styleSidebarContainer ]
    [
      Html.map App.Types.ClickSideBar (SideBar.View.view model.sidebarShortcuts)
    ],

    div [styleTabAndTextAreaContainer]
    [
      div [styleTabContainer]
      [
        Html.map App.Types.ClickTabBar (TabBar.View.view model.tabs)
      ],

      div [styleTextAreaContainer]
      [
        Html.map App.Types.ClickTextArea (model.renderFunction model.textArea)
      ]
    ]
  ]


-- Styles


styleAppContainer : Html.Attribute msg
styleAppContainer =
  styles
    [ width ( pct 100 )
    , height ( pct 100 )
    , displayFlex
    , flexDirection row
    , alignItems flexStart ]


styleSidebarContainer : Html.Attribute msg
styleSidebarContainer=
  styles
    [ height ( pct 100 )
    , flex ( int 1 )
    , backgroundColor colorMain
    ]


styleTabAndTextAreaContainer : Html.Attribute msg
styleTabAndTextAreaContainer=
  styles
    [ height ( pct 100 )
    , flex ( int 3 )
    , displayFlex
    , flexDirection column
    ]


styleTabContainer : Html.Attribute msg
styleTabContainer =
  styles
    [ height ( px 50 )
    , displayFlex
    , flexDirection row
    ]


styleTextAreaContainer : Html.Attribute msg
styleTextAreaContainer =
  styles
    [ flex ( int 1 )
    , backgroundColor colorHighlight
    , overflow scroll
    ]
