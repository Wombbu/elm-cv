module App.State exposing (..)

import Maybe exposing (withDefault, andThen)
import List exposing (filter, head, map)
import TextArea.View.Base
import TextArea.State
import TabBar.State exposing (setTabActiveWithText)
import SideBar.State exposing (setFileActiveWithName)
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
              sideBarFolders = SideBar.State.toggleExpanded name model.sideBarFolders
            }
            , Cmd.none
          )

        SideBar.Types.Open newTab ->
          (
            let
             newTabs =
               filter (TabBar.State.removeTabsWithName newTab.text) model.tabs
               |> map (\tab -> {tab | active = False})
            in
            { model |
              tabs = newTab :: newTabs,
              renderFunction = newTab.textAreaRenderFunc,
              sideBarFolders =
                model.sideBarFolders |> map (setFileActiveWithName newTab.text)
            }
            , Cmd.none
          )

    ClickTabBar msg ->
      case msg of
        TabBar.Types.Open (tabModel) ->
          (
            { model |
              renderFunction = tabModel.textAreaRenderFunc,
              textArea = tabModel.textAreaModel,
              tabs = model.tabs
                |> map (\tab -> { tab | active = False})
                |> map ( setTabActiveWithText tabModel.text )
            }
            , Cmd.none
          )

        TabBar.Types.Close text ->
          (
            let
              tabRemoved =
                model.tabs |> filter (TabBar.State.removeTabsWithName text)

              firstTabActive =
                head tabRemoved
                |> andThen
                  (\tab -> Just (tabRemoved |> map (setTabActiveWithText tab.text)))
                |> withDefault tabRemoved

              newActiveTabName =
                head tabRemoved
                |> andThen
                  (\tab -> Just (tab.text))
                |> withDefault ""

            in
              { model |
                tabs = firstTabActive,
                renderFunction =
                  (head firstTabActive)
                  |> andThen (\tab -> Just (tab.textAreaRenderFunc))
                  |> withDefault TextArea.View.Base.view,
                sideBarFolders = model.sideBarFolders |> map (setFileActiveWithName newActiveTabName)
              }
              , Cmd.none
          )


-- Init


init : (Model, Cmd msg)
init =
  ({ sideBarFolders = SideBar.State.init
  , tabs = TabBar.State.init
  , textArea = TextArea.State.init
  , renderFunction = TextArea.View.Base.view
  }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
