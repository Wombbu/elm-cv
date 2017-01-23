module App.State exposing (..)

import List exposing (map)
import TextArea.View
import TextArea.State
import TabBar.State
import SideBar.State
import App.Types exposing (..)
import SideBar.Types


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    AppendModel ->
      ({ model
      | tabs = model.tabs ++ TabBar.State.init
      }, Cmd.none)

    LogModel ->
      (Debug.log "Model:" model, Cmd.none)

    ClickTextArea msg ->
      (Debug.log "Text area clicked" model, Cmd.none)

    ClickSideBar msg ->
      case msg of
        SideBar.Types.ToggleFolder name ->
          (
            { model |
              sidebarShortcuts = SideBar.State.toggleExpanded name model.sidebarShortcuts
            }
            , Cmd.none
          )

        SideBar.Types.Open newTab ->
          (
            { model |
              tabs = newTab :: model.tabs,
              renderFunction = newTab.textAreaRenderFunc
           }
           , Cmd.none)

    ClickTabBar msg ->
      (Debug.log "Tab bar clicked" model, Cmd.none)


init : (Model, Cmd msg)
init =
  ({ sidebarShortcuts = SideBar.State.init
  , tabs = TabBar.State.init
  , textArea = TextArea.State.init
  , renderFunction = TextArea.View.java
  }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
