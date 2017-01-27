module TabBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, h1, p)
import Html.Events exposing (onClick)
import Html.CssHelpers
import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)
import Shared.Styles exposing (styles, justifyContentSpaceBetween)
import TabBar.Types exposing (..)


view : List Model -> Html Msg
view model =
  div [ class [ TabContainer ] ]
    ( model |> map renderTab )


renderTab : Model -> Html Msg
renderTab tab =
    div [ class [ Tab, active tab.active ] ]
      [
        div [ class [ Content ] ]
        [ p [] []
        , p [ onClick (Open (tab)), styles [ paddingLeft ( em 2 ) ] ] [ Html.text tab.text ]
        , p [ onClick (Close tab.text) ] [Html.text "Close"]
        ]
      ]


active : Bool -> CssClass
active isActive =
  Shared.Styles.pickClass Active Inactive isActive


-- Styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "tab-bar"


type CssClass =
  TabContainer
  | Tab
  | Content
  | Active
  | Inactive


css : Css.Stylesheet
css =
  (stylesheet << namespace "tab-bar")
  [ (.) Inactive
    [ backgroundColor Shared.Styles.colorSidebarBg
    , descendants
      [ Css.Elements.p [ color Shared.Styles.colorTextMain ] ]
    ]

  , (.) Active
    [ backgroundColor Shared.Styles.colorSidebarHilight
    , descendants
      [ Css.Elements.p [ color Shared.Styles.colorTextHilight ] ]
    ]

  , (.) Content
    [ displayFlex
    , justifyContentSpaceBetween
    , alignItems center
    , flexWrap noWrap
    , flex  ( int 1 )
    ]

  , (.) Tab
    [ displayFlex
    , flexDirection column
    , flex ( int 1 )
    , maxWidth ( em 15 )
    , minWidth ( em 7 )
    , minHeight ( pct 100 )
    ]

  , (.) TabContainer
    [ backgroundColor Shared.Styles.colorSidebarBg
    , displayFlex
    , flex  ( int 1 )
    , overflowX scroll
    , padding ( px 0 )
    , width ( pct 100 )
    ]
  ]
