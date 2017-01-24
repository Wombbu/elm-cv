module TabBar.State exposing (..)

import TabBar.Types exposing (..)
import TextArea.View.Java


-- Init


init : List Model
init =
  [ Model TextArea.View.Java.view "Intro.java" True ]


-- Helper functions


removeTabsWithName : String -> Model -> Bool
removeTabsWithName name tab =
  tab.text /= name


setActive : Bool -> Model -> Model
setActive isActive tab =
  { tab |
    active = isActive
  }
