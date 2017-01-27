module App.View exposing (..)

import Html exposing (Html, div, button)
import Html.CssHelpers
import Css exposing (..)
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
      Html.map App.Types.ClickSideBar (SideBar.View.view model.sidebarShortcuts)
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
  [ (#) AppContainer
    [ width ( pct 100 )
    , height ( pct 100 )
    , displayFlex
    , flexDirection row
    , alignItems flexStart
    , backgroundColor ( rgb 255 100 0 )
    ]

  , (#) SideBarContainer
    [ height ( px 40 )
    , margin ( px 0 )
    , padding ( px 0 )
    , flex ( int 1 )
    , backgroundColor ( rgb 100 100 0 )
    ]

  , (#) TabBarContainer
    [ height ( px 50 )
    , displayFlex
    , flexDirection row
    , backgroundColor ( rgb 100 100 200 )

    ]

  , (#) TextAreaContainer
    [ flex ( int 1 )
    , backgroundColor colorTextArea
    , overflow scroll
    , backgroundColor ( rgb 100 200 0 )
    ]

  , (#) TabAndTextAreaContainer
    [ height ( pct 100 )
    , flex ( int 3 )
    , displayFlex
    , flexDirection column
    , backgroundColor ( rgb 99 40 150 )
    ]
  ]
