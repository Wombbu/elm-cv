module SideBar.State exposing (..)

import SideBar.Types
import TextArea.State


-- Init


initShortcuts : List SideBar.Types.FileShortcut
initShortcuts =
  [ { name = "Intro.elm", file = TextArea.State.init }
  , { name = "Juuh.elm", file = TextArea.State.init }]
