module TabBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, h1, p)
import Html.Events exposing (onClick)
import Html.CssHelpers
import Css exposing (..)
import Css.Namespace exposing (namespace)
import Shared.Styles
import TabBar.Types exposing (..)


view : List Model -> Html Msg
view model =
  div [ class [ TabContainer ] ]
    ( model |> map renderTab )


renderTab : Model -> Html Msg
renderTab tab =
    div [ class [ Tab, active tab.active ] ]
      [ p [ onClick (Open (tab)) ] [ Html.text tab.text ]
      , p [ onClick (Close tab.text) ] [Html.text "Close"]
      ]


active : Bool -> CssClass
active isActive =
  Shared.Styles.pickClass Active Inactive isActive


-- Styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "tab-bar"


type CssClass =
  Tab
  | TabContainer
  | Active
  | Inactive


css : Css.Stylesheet
css =
  (stylesheet << namespace "tab-bar")
  [ (.) Inactive
    [ backgroundColor Shared.Styles.colorSidebarBg ]
  , (.) Active
    [ backgroundColor Shared.Styles.colorSidebarHilight ]
  , (.) Tab
    [ displayFlex
    , flexDirection row
    , flex ( int 1 )
    , textAlign center
    , width ( px 100 )
    ]

  , (.) TabContainer
    [ backgroundColor Shared.Styles.colorSidebarBg
    , displayFlex
    , flex  ( int 1 )
    , flexDirection row
    , alignItems flexStart
    , overflowX scroll
    , padding ( px 0 )
    ]
  ]
