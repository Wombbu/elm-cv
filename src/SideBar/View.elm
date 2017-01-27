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
        div [ onClick (ToggleFolder folder.folderName) ]
        [
          p [] [ Html.text folder.folderName ]
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
      [ class [FileShared,  active file.active]
        -- TODO create tabbar-model at the app.state, not here
      , onClick (Open (TabBar.Types.Model file.textAreaRenderFunc file.name True TextArea.State.init))
      ]
      [ p [] [ Html.text file.name ] ]



-- Styles


active : Bool -> CssClass
active isActive =
  pickClass FileActive FileInactive isActive


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


type CssClass
    = FileShared
    | FileInactive
    | FileActive


css : Css.Stylesheet
css =
  (stylesheet << namespace "text-area")
  [ (.) FileShared
    [ height ( pt 40 )
    , margin ( px 0 )
    , padding ( px 0 )
    ]

  , (.) FileInactive
    [ backgroundColor Shared.Styles.colorSidebarBg
    , children
      [ Css.Elements.p
        [ backgroundColor Shared.Styles.colorSidebarBg
        , color Shared.Styles.colorTextMain
        ]
      ]
    ]

  , (.) FileActive
      [ backgroundColor Shared.Styles.colorSidebarHilight
      , children
        [ Css.Elements.p
          [ backgroundColor Shared.Styles.colorSidebarHilight
          , color Shared.Styles.colorTextHilight
          ]
        ]
      ]
  ]
