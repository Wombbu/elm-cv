module App.Types exposing (..)

import Html exposing (Html)

import TextArea.Types exposing (..)

type Msg
  = ClickTextArea TextArea.Types.Msg
  |  AppendModel
  |  LogModel


type alias Model =
  { sidebarShortcuts: List FileShortcut
  , tabs : List TabButton
  , textArea : File
  , renderFunction :  File -> Html TextArea.Types.Msg
  }


type alias TabButton =
  { file : File
  , text : String
  }


type alias FileShortcut =
  { name : String
  , file : File
  }
