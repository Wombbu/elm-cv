module TextArea.View.Base exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p, span)
import Html.CssHelpers
import TextArea.Styles exposing (Classes(..), indent)
import Css exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers
import Shared.Styles exposing (justifyContentCenter, styles)
import TextArea.Types exposing (..)


view : SyntaxRenderFunc
view model =
    div [ class [ TextWrapper ], styles [ displayFlex ] ]
        [ div [ class [ CenterContent ] ]
            [ p [ styles [ fontSize (em 3), textAlign center ] ]
                [ Html.text "Open a file to explore" ]
              -- , span [ icon TextAreaHeart, styles [ fontSize ( em 10 ) ] ] [ ]
            ]
        ]



-- Styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


type CssClass
    = CenterContent


css : Css.Stylesheet
css =
    (stylesheet << namespace "text-area")
        [ (.) CenterContent
            [ displayFlex
            , flex (int 1)
            , flexDirection column
            , justifyContentCenter
            , alignItems center
            ]
        ]


colorText : Color
colorText =
    rgb 61 64 72
