module SideBar.State exposing (..)

import SideBar.Types
import TextArea.View


-- Init


initShortcuts : List SideBar.Types.Model
initShortcuts =
  [ { name = "Skills.java", textAreaRenderFunc = TextArea.View.java }
  , { name = "Employers.java", textAreaRenderFunc = TextArea.View.java }]
