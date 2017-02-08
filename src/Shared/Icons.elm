module Shared.Icons exposing (Icon(..), icon)

import Html
import Html.Attributes


type Icon
    = BottombarGit
    | BottomBarOk
    | BottomBarUp
    | TabbarClose1
    | TabbarClose2
    | SidebarArchive
    | SidebarTextFile
    | SidebarFolder1
    | SidebarFolder2
    | SidebarArrowLeft
      -- TODO change name
    | SidebarArrowRight
    | SidebarProjectFolder1
    | SidebarProjectFolder2
    | TextAreaHeart


iconClassNames : List ( Icon, String )
iconClassNames =
    [ ( BottombarGit, "icon-bottom-bar-git" )
    , ( BottomBarOk, "icon-bottom-bar-ok" )
    , ( BottomBarUp, "icon-bottom-bar-up" )
    , ( TabbarClose1, "icon-tab-bar-close-1" )
    , ( TabbarClose2, "icon-tab-bar-close-2" )
    , ( SidebarFolder1, "icon-sidebar-folder-1" )
    , ( SidebarArchive, "icon-archive" )
    , ( SidebarTextFile, "icon-sidebar-text" )
    , ( SidebarFolder2, "icon-sidebar-folder-2" )
    , ( SidebarArrowLeft, "icon-sidebar-arrow-left" )
    , ( SidebarArrowRight, "icon-sidebar-arrow-right" )
    , ( SidebarProjectFolder1, "icon-sidebar-project-folder-1" )
    , ( SidebarProjectFolder2, "icon-sidebar-project-folder-2" )
    , ( TextAreaHeart, "icon-heart-empty" )
    ]


getIconClass : Icon -> String
getIconClass icon =
    iconClassNames
        |> List.filter (\iconClass -> (Tuple.first iconClass) == icon)
        |> List.head
        |> Maybe.andThen (\iconClassName -> Just (Tuple.second iconClassName))
        |> Maybe.withDefault "No class found for icon"


icon : Icon -> Html.Attribute msg
icon iconType =
    Html.Attributes.class (getIconClass iconType)
