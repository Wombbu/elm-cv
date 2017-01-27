module SideBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, p)
import Html.Events exposing (onClick)
import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)
import Html.CssHelpers

import Shared.Styles exposing (pickClass)
import SideBar.Types exposing (..)
import TabBar.Types
import TextArea.State


-- Html


view : List Model -> Html Msg
view model =
  div []
    (model |> map renderFolder)


renderFolder : Model -> Html Msg
renderFolder folder =
      div []
      [
        div [ class [Button, active folder.active], onClick (ToggleFolder folder.folderName) ]
        [
          div [ class [FolderContent] ]
          [
            p [] [ Html.text folder.folderName ]
          ]
        ],
        if folder.expanded then
          div []
            (folder.files |> map renderFiles)
        else
          Html.text ""
      ]


renderFiles : SideBarFile -> Html Msg
renderFiles file =
      div
      [ class [Button,  active file.active]
        -- TODO create tabbar-model at the app.state, not here
      , onClick (Open (TabBar.Types.Model file.textAreaRenderFunc file.name True TextArea.State.init))
      ]
      [
        div [ class [ FileContent ] ]
        [
          p [] [ Html.text file.name ]
        ]
      ]


-- Styles


active : Bool -> CssClass
active isActive =
  pickClass Active Inactive isActive


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


type CssClass
    = Button
    | FileContent
    | FolderContent
    | Inactive
    | Active


css : Css.Stylesheet
css =
  (stylesheet << namespace "text-area")
  [ (.) Button
    [ height ( pt 30 )
    , margin ( px 0 )
    , padding ( px 0 )
    , displayFlex
    , flexDirection row
    , alignItems center
    ]

  , (.) FolderContent
    [ paddingLeft ( em 2 )

    ]

  , (.) FileContent
    [ paddingLeft ( em 3 )

    ]

  , (.) Inactive
    [ backgroundColor Shared.Styles.colorSidebarBg
    , descendants
      [ Css.Elements.p
        [ color Shared.Styles.colorTextMain
        ]
      ]
    ]

  , (.) Active
      [ backgroundColor Shared.Styles.colorSidebarHilight
      , descendants
        [ Css.Elements.p
          [ color Shared.Styles.colorTextHilight
          ]
        ]
      ]

  ]
