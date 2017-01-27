module App.View exposing (..)

import Html exposing (Html, div, button)
import Html.CssHelpers
import Css exposing (..)
import Css.Elements exposing (p)
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
  [ (#) AppContainer
    [ minWidth ( vw 80 )
    , maxWidth (vw 80 )
    , maxHeight ( vh 80 )
    , minHeight ( vh 80 )
    , displayFlex
    , flexDirection row
    , alignItems flexStart
    , backgroundColor ( rgb 255 100 0 )
    , overflow scroll
    , children
      [ Css.Elements.p
        [ padding ( px 0 )
        , margin ( px 0 ) ]
      ]
    ]

  , (#) SideBarContainer
    [ margin ( px 0 )
    , padding ( px 0 )
    , flex ( int 1 )
    , backgroundColor Shared.Styles.colorSidebarBg
    , maxHeight ( vh 80 )
    , minHeight (vh 80 )
    , overflow scroll
    ]

  , (#) TabBarContainer
    [ height ( pt 40 )
    , displayFlex
    , flexDirection row
    , backgroundColor ( rgb 100 100 200 )
    ]

  , (#) TextAreaContainer
    [ flex ( int 1 )
    , backgroundColor colorTextArea
    , backgroundColor ( rgb 100 200 0 )
    , overflow scroll
    ]

  , (#) TabAndTextAreaContainer
    [ height ( pct 100 )
    , flex ( int 3 )
    , displayFlex
    , flexDirection column
    , backgroundColor ( rgb 99 40 150 )
    , overflow scroll
    , maxHeight ( vh 80 )
    , minHeight ( vh 80 )
    ]
  ]
