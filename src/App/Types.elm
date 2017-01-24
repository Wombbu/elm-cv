module App.Types exposing (..)

import Html exposing (Html)

import TextArea.Types
import TabBar.Types
import SideBar.Types

type Msg
  = ClickTextArea TextArea.Types.Msg
  | ClickSideBar SideBar.Types.Msg
  | ClickTabBar TabBar.Types.Msg


type alias Model =
  { sidebarShortcuts: List SideBar.Types.Model
  , tabs : List TabBar.Types.Model
  , textArea : TextArea.Types.Model
  , renderFunction :  (TextArea.Types.Model -> Html TextArea.Types.Msg)
  }
