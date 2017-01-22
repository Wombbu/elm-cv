module SideBar.Types exposing (..)

import TextArea.Types

type alias FileShortcut =
  { name : String
  , file : TextArea.Types.Model
  }


type Msg =
    Open
