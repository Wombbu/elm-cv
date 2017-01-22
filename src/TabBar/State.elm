module TabBar.State exposing (..)

import TabBar.Types
import TextArea.State

-- Init


init : List TabBar.Types.Model
init =
  [ {file = TextArea.State.init, text = "Intro.elm" }]
