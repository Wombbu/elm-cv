module App.Types exposing (..)

import Html exposing (Html)

import TextArea.Types
import TabBar.Types
import SideBar.Types

type Msg
  = ClickTextArea TextArea.Types.Msg
  | ClickSideBar SideBar.Types.Msg
  |  AppendModel
  |  LogModel


type alias Model =
  { sidebarShortcuts: List SideBar.Types.FileShortcut
  , tabs : List TabBar.Types.Model
  , textArea : TextArea.Types.Model
  , renderFunction :  (TextArea.Types.Model -> Html TextArea.Types.Msg)
  }
