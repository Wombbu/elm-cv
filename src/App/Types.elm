module App.Types exposing (..)

import Html exposing (Html)

import TextArea.Types

type Msg
  = ClickTextArea TextArea.Types.Msg
  |  AppendModel
  |  LogModel


type alias Model =
  { sidebarShortcuts: List FileShortcut
  , tabs : List TabButton
  , textArea : TextArea.Types.Model
  , renderFunction :  (TextArea.Types.Model -> Html TextArea.Types.Msg)
  }


-- TODO split types under to their own modules


type alias TabButton =
  { file : TextArea.Types.Model
  , text : String
  }


type alias FileShortcut =
  { name : String
  , file : TextArea.Types.Model
  }
