module TabBar.State exposing (..)

import TabBar.Types
import TextArea.View


-- Init


init : List TabBar.Types.Model
init =
  [ {textAreaRenderFunc = TextArea.View.java, text = "Intro.java" }
  , {textAreaRenderFunc = TextArea.View.java, text = "Juuh.java" }
  ]
