module SideBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, p)
import Html.Events exposing (onClick)
import Css exposing (..)

import Shared.Styles exposing (..)
import SideBar.Types exposing (..)
import TabBar.Types

-- Html


view : List Model -> Html Msg
view model =
  renderFolder model


renderFolder : List Model -> Html Msg
renderFolder model =
  div []
    ( map (\folder ->
      div []
      [
        div [ styleSidebarEntry, onClick ToggleFolder ]
        [
          p [] [ Html.text folder.folderName ]
        ],

        div []
          [
            renderFiles folder.files
          ]
      ]
    )
    model)


renderFiles : List SideBarFile -> Html Msg
renderFiles files =
  div []
    (map (\file ->
      div [styleSidebarEntry, onClick (Open (TabBar.Types.Model file.textAreaRenderFunc file.name))]
        [
          p [] [ Html.text file.name ]
        ]
    )
    files)


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
