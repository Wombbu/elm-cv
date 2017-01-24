module TabBar.State exposing (..)

import TabBar.Types exposing (..)
import TextArea.View


-- Init


init : List Model
init =
  [ {textAreaRenderFunc = TextArea.View.java, text = "Intro.java" }
  , {textAreaRenderFunc = TextArea.View.java, text = "Juuh.java" }
  ]


-- Helper functions


removeTabsWithName : String -> Model -> Bool
removeTabsWithName name tab =
  tab.text /= name


-- makeTabActive Model -> Model
-- makeTabActive tab
--   { tab |
--
--   }
