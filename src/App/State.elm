module App.State exposing (..)

import TextArea.View exposing (..)
import TextArea.State exposing (..)
import App.Types as Types exposing (..)


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
  Types.AppendModel ->
    ({ model
    | tabs = [ {file = TextArea.State.initFile, text = "Intro.elm" }, {file = TextArea.State.initFile, text = "Eiss.elm" }]
    }, Cmd.none)
  Types.LogModel ->
    (Debug.log "Model:" model, Cmd.none)
  Types.ClickTextArea msg ->
    (Debug.log "Text area clicked" model, Cmd.none)


init : (Model, Cmd msg)
init =
  ({ sidebarShortcuts = initShortcuts
  , tabs = [ {file = TextArea.State.initFile, text = "Intro.elm" }]
  , textArea = TextArea.State.initFile
  , renderFunction = TextArea.View.java
  }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


initShortcuts : List FileShortcut
initShortcuts =
  [ { name = "Intro.elm", file = TextArea.State.initFile }
  , { name = "Juuh.elm", file = TextArea.State.initFile }]
