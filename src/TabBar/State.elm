module TabBar.State exposing (..)

import TabBar.Types exposing (..)
import TextArea.View.Java
import TextArea.State


-- Init


init : List Model
init =
  [ Model TextArea.View.Java.view "Intro.java" True TextArea.State.init]


-- Helper functions


removeTabsWithName : String -> Model -> Bool
removeTabsWithName name tab =
  tab.text /= name


setActive : Bool -> Model -> Model
setActive isActive tab =
  { tab |
    active = isActive
  }
