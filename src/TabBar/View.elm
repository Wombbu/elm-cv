module TabBar.View exposing (..)

import Debug
import List exposing (map)
import Html exposing (Html, div, h1, p)
import Html.Events exposing (onClick)
import Css exposing (..)
import Shared.Styles exposing (..)

import TabBar.Types exposing (..)


view : List Model -> Html Msg
view model =
  renderTabs model


renderTabs : List Model -> Html Msg
renderTabs model =
  div [ styleTabContainer ]
    (map (\tab ->
      div [styleTab]
      [
        p [ onClick Open ] [ Html.text tab.text ]
      ]
    ) model)


-- Styles


styleTab : Html.Attribute msg
styleTab =
  styles
    [ backgroundColor colorHighlight
    , displayFlex
    , flex ( int 1 )
    , textAlign center
    , width ( px 100 )
    ]


styleTabContainer : Html.Attribute msg
styleTabContainer =
  styles
    [ backgroundColor colorMain
    , displayFlex
    , flex  ( int 1 )
    , flexDirection row
    , alignItems flexStart
    , overflowX scroll
    , padding ( px 0 )
    ]