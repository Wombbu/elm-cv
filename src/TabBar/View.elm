module TabBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, h1, p)
import Html.Events exposing (onClick)
import Html.CssHelpers
import Css exposing (..)
import Css.Namespace exposing (namespace)
import Shared.Styles exposing (..)

import TabBar.Types exposing (..)


view : List Model -> Html Msg
view model =
  renderTabs model


renderTabs : List Model -> Html Msg
renderTabs model =
  div [ class [ TabContainer ] ]
    (map (\tab ->
      div [class [ Tab ]]
      [
        p [ onClick (Open (tab.textAreaRenderFunc, tab.textAreaModel)) ] [ Html.text tab.text ],
        p [ onClick (Close tab.text) ] [Html.text "Close"]
      ]
    ) model)


-- Styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "tab-bar"

type CssClasses =
  Tab
  | TabContainer


css : Css.Stylesheet
css =
  (stylesheet << namespace "tab-bar")
  [ (.) Tab
    [ backgroundColor colorTextArea
    , displayFlex
    , flexDirection row
    , flex ( int 1 )
    , textAlign center
    , width ( px 100 )
    ]

  , (.) TabContainer
    [ backgroundColor colorSidebarBg
    , displayFlex
    , flex  ( int 1 )
    , flexDirection row
    , alignItems flexStart
    , overflowX scroll
    , padding ( px 0 )
    ]
  ]


styleTab : Html.Attribute msg
styleTab =
  styles
    [ backgroundColor colorTextArea
    , displayFlex
    , flexDirection row
    , flex ( int 1 )
    , textAlign center
    , width ( px 100 )
    ]


styleTabContainer : Html.Attribute msg
styleTabContainer =
  styles
    [ backgroundColor colorSidebarBg
    , displayFlex
    , flex  ( int 1 )
    , flexDirection row
    , alignItems flexStart
    , overflowX scroll
    , padding ( px 0 )
    ]
