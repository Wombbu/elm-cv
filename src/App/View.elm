module App.View exposing (..)

import Html exposing (Html, div, button)
import Html.CssHelpers
import Css exposing (..)
import Css.Elements exposing (p, h1)
import Css.Namespace exposing (namespace)
import Shared.Styles exposing (..)

import App.Types exposing (Msg(..), Model)
import SideBar.View
import TabBar.View


view : Model -> Html Msg
view model =
  div [ id AppContainer ]
  [
    div [ id NavigationAndTextContainer ]
    [
      sidebar model,
      tabsAndTextArea model
    ]
  ]

sidebar : Model -> Html Msg
sidebar model =
  div [ id SideBarContainer ]
  [
    Html.map App.Types.ClickSideBar (SideBar.View.view model.sideBarFolders)
  ]

tabsAndTextArea : Model -> Html Msg
tabsAndTextArea model =
  div [id TabAndTextAreaContainer]
  [
    div [id TabBarContainer]
    [
      Html.map App.Types.ClickTabBar (TabBar.View.view model.tabs)
    ],

    div [id TextAreaContainer]
    [
      Html.map App.Types.ClickTextArea (model.renderFunction model.textArea)
    ]
  ]


-- Styles

{ id, class, classList } =
    Html.CssHelpers.withNamespace "app"

type CssIds =
  AppContainer
  | NavigationAndTextContainer
  | SideBarContainer
  | TabBarContainer
  | TextAreaContainer
  | TabAndTextAreaContainer

css : Css.Stylesheet
css =
  (stylesheet << namespace "app")
  [ p reset
  , h1 reset
  , Css.Elements.div reset

  , (#) AppContainer
    [ flex ( int 1 )
    , displayFlex
    , alignItems stretch
    , flexDirection row
    ]

  , (#) NavigationAndTextContainer
    [ flex ( int 1 )
    , displayFlex
    , alignItems stretch
    , overflow hidden
    , backgroundColor ( rgb 255 100 0 )
    ]

  , (#) SideBarContainer
    [ minWidth ( px 200 )
    , maxWidth ( px 200 )
    , displayFlex
    , alignItems stretch
    , overflow scroll
    , backgroundColor ( rgb 199 18 242 )
    , descendants
      [ Css.Elements.p uiTextStyle ]
    ]

  , (#) TabBarContainer
    [ minHeight ( em tabBarHeight )
    , displayFlex
    , alignItems stretch
    , backgroundColor ( rgb 100 100 200 )
    , descendants
      [ Css.Elements.p uiTextStyle ]
    ]

  , (#) TextAreaContainer
    [ displayFlex
    , flex ( int 1 )
    , alignItems stretch
    , backgroundColor ( rgb 43 11 150 )
    , padding ( px 0 )
    ]

  , (#) TabAndTextAreaContainer
    [ flex ( int 1 )
    , displayFlex
    , flexDirection column
    , alignItems stretch
    , overflow auto
    , backgroundColor ( rgb 99 40 150 )
    ]
  ]

uiTextStyle : List Mixin
uiTextStyle =
  [ fontFamily sansSerif
  ]


reset : List Mixin
reset =
  [ padding ( px 0 )
  , margin ( px 0 )
  , border ( px 0 )
  , cursor default
  , userSelectNone
  ]
