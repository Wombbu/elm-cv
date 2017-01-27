module SideBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, p)
import Html.Events exposing (onClick)
import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)
import Html.CssHelpers

import Shared.Styles exposing (..)
import SideBar.Types exposing (..)
import TabBar.Types
import TextArea.State

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
        div [ onClick (ToggleFolder folder.folderName) ]
        [
          p [] [ Html.text folder.folderName ]
        ],
        if folder.expanded then
          div []
            [
              renderFiles folder.files
            ]
        else
          Html.text ""
      ]
    )
    model)


renderFiles : List SideBarFile -> Html Msg
renderFiles files =
  div []
    (map (\file ->
      div
      [ class [SidebarCommon, SidebarHilight]
        -- TODO create tabbar-model at the app.state, not here
      , onClick (Open (TabBar.Types.Model file.textAreaRenderFunc file.name True TextArea.State.init))
      ]
        [
          p [] [ Html.text file.name ]
        ]
    )
    files)


-- Styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"

type CssClasses
    = SidebarCommon
    | SidebarDefault
    | SidebarHilight

css : Css.Stylesheet
css =
  (stylesheet << namespace "text-area")
  [ (.) SidebarCommon
    [ height ( px 40 )
    , margin ( px 0 )
    , padding ( px 0 )
    ]

  , (.) SidebarDefault
    [ backgroundColor Shared.Styles.colorSidebarBg
    , children
      [ Css.Elements.p
        [ backgroundColor Shared.Styles.colorSidebarBg
        , color Shared.Styles.colorTextMain
        ]
      ]
    ]
    
  , (.) SidebarHilight
      [ backgroundColor Shared.Styles.colorSidebarHilight
      , children
        [ Css.Elements.p
          [ backgroundColor Shared.Styles.colorSidebarHilight
          , color Shared.Styles.colorTextHilight
          ]
        ]
      ]
  ]
