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
  , justifyContentCenter, colorTextHilight
  )
import TabBar.Types exposing (..)
import Shared.Icons exposing (Icon(..), icon)


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
        , div [ class [CloseButton] ]
          [ p [ icon TabbarClose1, onClick (Close tab.text) ] []
          ]
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
  | CloseButton


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
    , hover
      [ children
        [ (.) CloseButton
          [ maxWidth ( px 13 )
          , maxHeight ( px 13 )
          , marginRight ( px 3 )
          , marginLeft ( px 0 )
          ]
        ]
      ]
    ]

  , (.) Tab
    [ displayFlex
    , flexDirection row
    , flex ( int 1 )
    , maxWidth ( em 8 )
    , minWidth ( em 6 )
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

  , (.) CloseButton
    [ maxWidth ( px 0 )
    , maxHeight ( px 0 )

    , overflow hidden
    , borderRadius ( px 3 )
    , fontSize ( em 1 )
    , marginRight ( px 9.5 )
    , marginLeft ( px 6.5 )
    , displayFlex
    , alignItems center
    , justifyContentCenter
    , property "transition" <| "background-color 0.3s, max-width 0.3s, max-height 0.3s, margin-right 0.3s, margin-left 0.3s"
    , hover
      [ backgroundColor colorTabBlue
      , children
        [ Css.Elements.p
          [ color colorTextHilight
          ]
        ]
      ]
    ]
  ]

bottomBorder : Float -> Mixin
bottomBorder width =
    property "box-shadow" <| "inset 0px " ++ toString -width ++ "px 0px 0px rgb(24, 26, 31)"

boxShadowOnTop: Css.Mixin
boxShadowOnTop =
  property "box-shadow" <| "inset 1px 4px 6px -6px"
