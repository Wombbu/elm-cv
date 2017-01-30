module TabBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, h1, p)
import Html.Events exposing (onClick)
import Html.CssHelpers
import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)
import Shared.Styles exposing
  ( styles, colorTabBlue, tabBarHeight, justifyContentSpaceBetween, zIndex
  , customBorder, colorBorder, colorSidebarBg, borderWidth, colorTextArea
  )
import TabBar.Types exposing (..)


view : List Model -> Html Msg
view model =
  div [ class [ TabContainer ] ]
    ( model |> map renderTab )


renderTab : Model -> Html Msg
renderTab tab =
    div
      -- Causes a bug when trying to close: Calls open and close at same time
      [ onClick (Open tab)
      , class [ Tab, active tab.active ]
      ]
      [ if tab.active then
           div [ class [ ActiveIndicator ] ] [ ]
        else
          Html.text ""

      , div [ class [ Content ] ]
        [ p [] [ Html.text "" ] -- Help align the next object center because parent flex align is space between ¯\_(ツ)_/¯
        , p [ styles [ textAlign right ] ] [ Html.text tab.text ]
        , p [ onClick (Close tab.text), styles [ paddingRight ( px 10 ) ] ] [ Html.text "X" ]
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
  | ActiveIndicator


css : Css.Stylesheet
css =
  (stylesheet << namespace "tab-bar")
  [ (.) Inactive
    [ backgroundColor Shared.Styles.colorSidebarBg
    , borderStyle solid
    , borderColor colorSidebarBg
    , borderBottomColor colorBorder
    , customBorder [ borderWidth, borderWidth, borderWidth, borderWidth ]
    , descendants
      [ Css.Elements.p [ color Shared.Styles.colorTabText ] ]
    ]

  , (.) Active
    [ boxShadowOnTop
    , color ( rgb 100 100 100 )
    , backgroundColor Shared.Styles.colorTextArea
    , customBorder [ borderWidth, borderWidth, borderWidth, borderWidth ]
    , borderStyle solid
    , borderColor colorBorder
    , borderBottomColor colorTextArea
    , borderRadius4 (px 3) (px 3) (px 0) (px 0)
    , descendants
      [ Css.Elements.p [ color Shared.Styles.colorTabTextHilight ] ]
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
    , flexDirection row
    , flex ( int 1 )
    , maxWidth ( em 14 )
    , minWidth ( em 7 )
    , minHeight ( pct 85 )
    , maxHeight ( pct 85 )
    , alignItems stretch
    , zIndex 1
    ]

  , (.) TabContainer
    [ displayFlex
    , alignItems flexEnd
    , flex  ( int 1 )
    , padding ( px 0 )
    , bottomBorder borderWidth
    , backgroundColor colorSidebarBg
    , overflowY hidden
    ]

  , (.) ActiveIndicator
    [ backgroundColor colorTabBlue
    , maxWidth ( px 2 )
    , minWidth ( px 2 )
    , flex ( int 1 )
    , borderRadius2 (px 2) (px 0)
    ]
  ]

bottomBorder : Float -> Mixin
bottomBorder width =
    property "box-shadow" <| "inset 0px " ++ toString -width ++ "px 0px 0px rgb(24, 26, 31)"

boxShadowOnTop: Css.Mixin
boxShadowOnTop =
  property "box-shadow" <| "inset 1px 4px 6px -6px"
