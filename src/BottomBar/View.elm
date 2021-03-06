module BottomBar.View exposing (view, css, Msg(..))

import Html exposing (Html, div, h1, p, span)
import Html.CssHelpers
import Css exposing (..)
import Css.Namespace exposing (namespace)
import Css.Elements
import Shared.Styles
    exposing
        ( styles
        , colorTabBlue
        , tabBarHeight
        , justifyContentSpaceBetween
        , zIndex
        , customBorder
        , colorBorder
        , colorSidebarBg
        , borderWidth
        , colorTextArea
        , justifyContentCenter
        , colorTextHilight
        , colorTabCloseActive
        , colorSidebarTextMain
        , justifyContentFlexEnd
        )
import Shared.Icons exposing (Icon(..), icon)
import Shared.Types exposing (Syntax(..))
import Maybe


type Msg
    = OnlyHtml


view : Maybe Syntax -> Html ()
view syntax =
    div [ class [ BarContainer ] ]
        [ div [ class [ ContainerLeft ] ]
            [ span [ icon BottomBarOk, styles [ fontSize (em 0.8), color colorTabBlue ] ] []
            , p [ styles [ color colorTabBlue ] ] [ Html.text "No Issues" ]
            ]
        , div [ class [ ContainerRight ] ]
            ((getSyntaxHtml syntax)
                ++ [ span [ class [ Spacer ] ] []
                   , span [ icon BottomBarUp, styles [ fontSize (em 0.6) ] ] []
                   , p [] [ Html.text "2" ]
                   , span [ class [ Spacer ] ] []
                   , span [ icon BottombarGit ] []
                   , p [] [ Html.text "master" ]
                   , span [ styles [ marginLeft (px 7) ] ] []
                   ]
            )
        ]


getSyntaxText : Syntax -> String
getSyntaxText syntax =
    case syntax of
        Java ->
            "Java"

        Elm ->
            "Elm"


getSyntaxHtml : Maybe Syntax -> List (Html ())
getSyntaxHtml maybeSyntax =
    case maybeSyntax of
        Just syntax ->
            [ p [] [ Html.text "LF" ]
            , span [ class [ Spacer ] ] []
            , p [] [ Html.text "UTF-8" ]
            , span [ class [ Spacer ] ] []
            , p [] [ Html.text (getSyntaxText syntax) ]
            ]

        Nothing ->
            []



-- Styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "bottom-bar"


type Class
    = BarContainer
    | ContainerLeft
    | ContainerRight
    | Spacer


css : Css.Stylesheet
css =
    (stylesheet << namespace "bottom-bar")
        [ (.) BarContainer
            [ flex (int 1)
            , displayFlex
            , alignItems stretch
            , justifyContentSpaceBetween
            , overflow hidden
            , descendants
                [ Css.Elements.p
                    [ color colorSidebarTextMain
                    , fontSize (em 0.7)
                    ]
                ]
            ]
        , (.) ContainerLeft
            [ flex (int 1)
            , displayFlex
            , alignItems center
            ]
        , (.) ContainerRight
            [ flex (int 2)
            , displayFlex
            , alignItems center
            , justifyContentFlexEnd
            ]
        , (.) Spacer
            [ marginLeft (px 14) ]
        ]
