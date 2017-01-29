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
  div [id AppContainer]
  [
    div [ id SideBarContainer ]
    [
      Html.map App.Types.ClickSideBar (SideBar.View.view model.sideBarFolders)
    ],

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
  ]


-- Styles

{ id, class, classList } =
    Html.CssHelpers.withNamespace "app"

type CssIds =
  AppContainer
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
    [ minWidth inherit
    , maxWidth inherit
    , maxHeight inherit
    , minHeight inherit
    , displayFlex
    , flexDirection row
    , alignItems flexStart
    , backgroundColor ( rgb 255 100 0 )
    , overflow scroll
    ]

  , (#) SideBarContainer
    [ margin ( px 0 )
    , padding ( px 0 )
    , flex ( int 1 )
    , displayFlex
    , backgroundColor ( rgb 199 18 242 )
    , maxHeight inherit
    , minHeight inherit
    , overflow scroll
    , descendants
      [ Css.Elements.p uiTextStyle ]
    ]

  , (#) TabBarContainer
    [ maxHeight ( em tabBarHeight )
    , minHeight ( em tabBarHeight )
    , overflow visible
    , displayFlex
    , flexDirection row
    , backgroundColor ( rgb 100 100 200 )
    , descendants
      [ Css.Elements.p uiTextStyle ]
    ]

  , (#) TextAreaContainer
    [ displayFlex
    , flex ( int 1 )
    , backgroundColor ( rgb 43 11 150 )
    , overflow scroll
    , padding ( px 0 )
    ]

  , (#) TabAndTextAreaContainer
    [ height ( pct 100 )
    , flex ( int 3 )
    , displayFlex
    , flexDirection column
    , backgroundColor ( rgb 99 40 150 )
    , maxHeight inherit
    , minHeight inherit
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
