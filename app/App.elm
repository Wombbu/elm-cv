module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import File exposing (..)


-- Types


type alias TabButton =
  { file : File
  , text : String
  }


type alias FileShortcut =
  { name : String
  , file : File
  }


type alias Model =
  { sidebarShortcuts: List FileShortcut
  , tabs : List TabButton
  , textArea : File
  }


-- Update


type Msg
  = AppendModel
  | LogModel

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
  AppendModel ->
    ({ model
    | tabs = [ {file = File.initFile, text = "Intro.elm" }, {file = File.initFile, text = "Eiss.elm" }]
    }, Cmd.none)
  LogModel ->
    (Debug.log "Model:" model, Cmd.none)


-- View


view : Model -> Html Msg
view model =
  div []
  [ button [onClick LogModel] [text "Log model"]
  , button [onClick AppendModel ] [text "Append to model"]
  ]


-- Program


main : Program Never Model Msg
main =
  Html.program
  { init = init
  , subscriptions = subscriptions
  , update = update
  , view = view
  }


-- Init


initShortcuts : List FileShortcut
initShortcuts =
  [ { name = "Intro.elm", file = File.initFile }
  , { name = "Juuh.elm", file = File.initFile }]


init : (Model, Cmd msg)
init =
  ({ sidebarShortcuts = initShortcuts
  , tabs = [ {file = File.initFile, text = "Intro.elm" }]
  , textArea = File.initFile
  }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
