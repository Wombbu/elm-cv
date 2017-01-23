module App.State exposing (..)

import TextArea.View
import TextArea.State
import TabBar.State
import SideBar.State
import App.Types as Types exposing (..)


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
  Types.AppendModel ->
    ({ model
    | tabs = model.tabs ++ TabBar.State.init
    }, Cmd.none)
  Types.LogModel ->
    (Debug.log "Model:" model, Cmd.none)
  Types.ClickTextArea msg ->
    (Debug.log "Text area clicked" model, Cmd.none)
  Types.ClickSideBar msg ->
    (Debug.log "Text area clicked" model, Cmd.none)
  Types.ClickTabBar msg ->
    (Debug.log "Tab bar clicked" model, Cmd.none)


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
