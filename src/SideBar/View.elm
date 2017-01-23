module SideBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, p)
import Html.Events exposing (onClick)
import Css exposing (..)

import Shared.Styles exposing (..)
import SideBar.Types exposing (..)


-- Html


view : List Model -> Html Msg
view model =
  renderFiles model


renderFiles : List Model -> Html Msg
renderFiles model =
  div []
    (map (\file ->
      div [styleSidebarEntry, onClick SideBar.Types.Open]
        [
          p [] [ Html.text file.name ]
        ]
    )
    model)


-- Styles


styleSidebarEntry : Html.Attribute msg
styleSidebarEntry =
  styles
    [ backgroundColor ( Shared.Styles.colorHighlight )
    , overflowX hidden
    , overflowY hidden
    , height ( px 40 )
    , border ( px 1 )
    ]
