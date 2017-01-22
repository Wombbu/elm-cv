module App.State exposing (..)

import TextArea.View exposing (..)
import TextArea.State exposing (..)
import TabBar.State exposing (..)
import SideBar.State
import App.Types as Types exposing (..)


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
  Types.AppendModel ->
    ({ model
    | tabs = [ {file = TextArea.State.init, text = "Intro.elm" }, {file = TextArea.State.init, text = "Eiss.elm" }]
    }, Cmd.none)
  Types.LogModel ->
    (Debug.log "Model:" model, Cmd.none)
  Types.ClickTextArea msg ->
    (Debug.log "Text area clicked" model, Cmd.none)
  Types.ClickSideBar msg ->
    (Debug.log "Text area clicked" model, Cmd.none)


init : (Model, Cmd msg)
init =
  ({ sidebarShortcuts = SideBar.State.initShortcuts
  , tabs = TabBar.State.init
  , textArea = TextArea.State.init
  , renderFunction = TextArea.View.java
  }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
