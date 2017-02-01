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
import Shared.Icons exposing (icon, Icon(..))


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
    , paddingLeft (px 0)
    ]
  ]
  [ div [ class [FolderContent], styles [paddingLeft (px 5)]]
    [ p [ icon (arrowDown True) ] []
    , p [ icon SidebarArchive ] []
    , p [styles [paddingLeft ( px 3 )]] [ Html.text "elm-cv" ]
    ]
  ]


renderFolder : Model -> Html Msg
renderFolder folder =
      div []
      [ div [ class [Button, active folder.active], onClick (ToggleFolder folder.folderName) ]
        [ div [ class [FolderContent] ]
          [ p [ icon (arrowDown folder.expanded) ] []
          , p [ icon SidebarFolder1 ] []
          , p [styles [paddingLeft ( px 3 )]] [ Html.text folder.folderName ]
          ]
        ]
        , if folder.expanded then
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
      [ div [ class [ FileContent ] ]
        [ p [ icon SidebarTextFile ] []
        , p [styles [paddingLeft ( px 3 )]] [ Html.text file.name ]
        ]
      ]


-- Styles

arrowDown : Bool -> Icon
arrowDown down =
  pickClass SidebarArrowRight SidebarArrowLeft down

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
    [ paddingLeft ( px 8 )
    , displayFlex
    ]

  , (.) FileContent
    [ paddingLeft ( px 42 )
    , displayFlex
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
