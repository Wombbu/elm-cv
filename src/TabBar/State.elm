module TabBar.State exposing (..)

import TabBar.Types exposing (..)


-- Init


init : List Model
init =
  [ ]


-- Helper functions


removeTabsWithName : String -> Model -> Bool
removeTabsWithName name tab =
  tab.text /= name


setActive : Bool -> Model -> Model
setActive isActive tab =
  { tab |
    active = isActive
  }


-- TODO later in development, delete if not needed
setTabActiveWithText : String -> Model -> Model
setTabActiveWithText withText tab =
  if withText == tab.text then
    { tab |
     active = True
    }
  else
    tab
