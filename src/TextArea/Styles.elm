module TextArea.Styles exposing (..)

import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)
import Html exposing (Html, span)
import Shared.Styles exposing (colorBorder, colorTextArea, styles, customBorder, borderWidth, colorBorder)


-- Styles
-- TODO
-- Padding
-- Text base color
-- Hilights
-- Row spacing
-- Comment style
-- Font


type Classes
    = TextWrapper


css : Css.Stylesheet
css =
    (stylesheet << namespace "text-area")
        [ (.) TextWrapper
            [ backgroundColor colorTextArea
            , flex (int 1)
            , paddingLeft (em 2)
            , customBorder [ 0, borderWidth, borderWidth, borderWidth ]
            , borderColor colorBorder
            , borderStyle solid
            , overflow auto
            , descendants [ Css.Elements.p textStyle ]
            ]
        ]



-- Helpers


hi : String -> Css.Color -> Html msg
hi text textColor =
    span [ styles [ color textColor ] ] [ Html.text text ]


textStyle : List Css.Mixin
textStyle =
    [ property "font-family" <| "Inconsolata, monospace"
    , fontSize (em 1)
      -- , fontWeight lighter
    , color Shared.Styles.colorTextMain
    ]


indentMixin : Float -> Css.Mixin
indentMixin spaces =
    paddingLeft (ex (spaces))


indent : Float -> Html.Attribute msg
indent spaces =
    styles [ paddingLeft (em (spaces)) ]
