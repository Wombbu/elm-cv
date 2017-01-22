module App.State exposing (..)

import TextArea.File as File exposing (..)
import App.Types as Types exposing (..)


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
  Types.AppendModel ->
    ({ model
    | tabs = [ {file = File.initFile, text = "Intro.elm" }, {file = File.initFile, text = "Eiss.elm" }]
    }, Cmd.none)
  Types.LogModel ->
    (Debug.log "Model:" model, Cmd.none)
  Types.ClickTextArea msg ->
    (Debug.log "Text area clicked" model, Cmd.none)


init : (Model, Cmd msg)
init =
  ({ sidebarShortcuts = initShortcuts
  , tabs = [ {file = File.initFile, text = "Intro.elm" }]
  , textArea = File.initFile
  , renderFunction = File.renderJava
  }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



initShortcuts : List FileShortcut
initShortcuts =
  [ { name = "Intro.elm", file = File.initFile }
  , { name = "Juuh.elm", file = File.initFile }]
