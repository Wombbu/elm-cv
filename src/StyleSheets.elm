port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)

import SideBar.View
import App.View
import TextArea.Styles
import TabBar.View


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [
      ( "dist/styles.css"
      , Css.File.compile
        [ SideBar.View.css
        , App.View.css
        , TabBar.View.css
        , TextArea.Styles.css
        ]
      )
    ]


main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
