module App.State exposing (..)

import Maybe exposing (withDefault)
import List exposing (filter, head, map)
import TextArea.View.Base
import TextArea.State
import TextArea.Types
import TabBar.State
import SideBar.State
import App.Types exposing (..)
import SideBar.Types
import TabBar.Types


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
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
              tabs = newTab :: filter (TabBar.State.removeTabsWithName newTab.text) model.tabs,
              renderFunction = newTab.textAreaRenderFunc
           }
           , Cmd.none)

    ClickTabBar msg ->
      case msg of
        TabBar.Types.Open (syntaxFunc, textAreaModel) ->
          (
            { model |
              renderFunction = syntaxFunc,
              textArea = textAreaModel
            }
            , Cmd.none
          )

        TabBar.Types.Close text ->
          -- TODO refactor this
          (
            let
              tabRemoved =
                filter ( TabBar.State.removeTabsWithName text ) model.tabs

              tabRemovedAndFirstTabActive =
                let
                  firstTab =
                    head model.tabs
                in
                  case firstTab of
                    Just tab ->
                      map (setTabActive tab) tabRemoved
                    Nothing ->
                      tabRemoved
            in
              { model |
                tabs = tabRemovedAndFirstTabActive,
                renderFunction = getRenderingFunc (head tabRemovedAndFirstTabActive)
              }
              , Cmd.none
          )


setTabActive : TabBar.Types.Model -> TabBar.Types.Model -> TabBar.Types.Model
setTabActive tab1 tab2 =
  if tab1.text == tab2.text then
    { tab2 |
     active = True
    }
  else
    tab2


getRenderingFunc : Maybe TabBar.Types.Model -> TextArea.Types.SyntaxRenderFunc
getRenderingFunc model =
  case model of
    Just tab ->
      tab.textAreaRenderFunc
    Nothing ->
      TextArea.View.Base.view


-- Init


init : (Model, Cmd msg)
init =
  ({ sidebarShortcuts = SideBar.State.init
  , tabs = TabBar.State.init
  , textArea = TextArea.State.init
  , renderFunction = TextArea.View.Base.view
  }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
