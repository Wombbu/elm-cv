module TextArea.Styles exposing (..)

import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)
import Html
import Shared.Styles exposing
  (colorBorder, colorTextArea, styles, customBorder, borderWidth, colorBorder)


-- Styles


-- TODO
-- Padding
-- Text base color
-- Hilights
-- Row spacing
-- Comment style
-- Font


type Classes =
  TextWrapper


css : Css.Stylesheet
css =
  ( stylesheet << namespace "text-area")
  [ (.) TextWrapper
    [ backgroundColor colorTextArea
    , paddingLeft ( em 2 )
    , paddingTop ( em 1 )

    , flex ( int 1 )

    , customBorder [ 0, borderWidth, borderWidth, borderWidth ]
    , borderColor colorBorder
    , borderStyle solid

    , overflow auto
    
    , descendants [ Css.Elements.p textStyle ]
    ]
  ]


-- Helpers


textStyle : List Css.Mixin
textStyle =
  [ fontFamily monospace
  , fontSize ( em 5 )
  , color Shared.Styles.colorTextMain
  ]


indentMixin : Float -> Css.Mixin
indentMixin spaces =
  paddingLeft (em (spaces))



indent : Float -> Html.Attribute msg
indent spaces =
  styles [paddingLeft (em (spaces))]
