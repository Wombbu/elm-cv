module SideBar.View exposing (..)

import List exposing (map)
import Html exposing (Html, div, p)
import Html.Events exposing (onClick)
import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)
import Html.CssHelpers

import Shared.Styles exposing (pickClass, tabBarHeight, tabHeightPct, colorSidebarBg, styles)
import SideBar.Types exposing (..)
import TabBar.Types
import TextArea.State


-- Html


view : List Model -> Html Msg
view model =
  div [ class [ Container ] ]
    ( renderProjectFolder
    :: (model |> map renderFolder))


renderProjectFolder : Html msg
renderProjectFolder =
  div
  [ class [ Button, Inactive ]
  , styles
    [ minHeight (em (tabBarHeight * tabHeightPct))
    , maxHeight (em (tabBarHeight * tabHeightPct))
    ]
  ]
  [
    p [] [Html.text "[ ] v elm-cv"]
  ]


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
    Html.CssHelpers.withNamespace "sidebar"


type CssClass
    = Button
    | Container
    | FileContent
    | FolderContent
    | Inactive
    | Active


css : Css.Stylesheet
css =
  (stylesheet << namespace "sidebar")
  [ (.) Button
    [ height ( em 1.6 )
    , margin ( px 0 )
    , padding ( px 0 )
    , paddingLeft ( px 14 )
    , displayFlex
    , flexDirection row
    , alignItems center
    ]

  , (.) Container
    [ paddingTop ( em (tabBarHeight - (tabBarHeight * tabHeightPct)))
    , flex ( int 1 )
    , backgroundColor ( colorSidebarBg )
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
