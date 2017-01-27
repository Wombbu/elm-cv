port module Stylesheets exposing (..)

import SideBar.View
import Css.File exposing (CssFileStructure, CssCompilerProgram)


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [
      ( "dist/styles.css"
      , Css.File.compile
        [
          SideBar.View.css
        ]
      )
    ]


main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
