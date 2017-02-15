module App.State exposing (..)

import App.Http
import Maybe exposing (withDefault, andThen)
import List exposing (filter, head, map)
import TextArea.View.Base
import TextArea.State
import TabBar.State exposing (setTabActiveWithText)
import SideBar.State exposing (setFileActiveWithName, setFolderActiveWithName)
import App.Types exposing (..)
import SideBar.Types
import TabBar.Types


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ClickTextArea msg ->
            ( Debug.log "Text area clicked" model, Cmd.none )

        ClickSideBar msg ->
            case msg of
                SideBar.Types.ToggleFolder name ->
                    ( { model
                        | sideBarFolders =
                            model.sideBarFolders
                                |> map (SideBar.State.goThroughAllFiles (\file -> { file | active = False }))
                                |> map (\folder -> { folder | active = False })
                                |> map (SideBar.State.setFolderActiveWithName name)
                                |> map (SideBar.State.toggleExpanded name)
                      }
                    , Cmd.none
                    )

                SideBar.Types.Open newTab ->
                    ( let
                        inActiveUnDeletedTabs =
                            model.tabs
                                |> filter (TabBar.State.removeTabsWithName newTab.text)
                                |> map (\tab -> { tab | active = False })
                      in
                        { model
                            | tabs = newTab :: inActiveUnDeletedTabs
                            , renderFunction = newTab.textAreaRenderFunc
                            , sideBarFolders =
                                model.sideBarFolders
                                    |> map (\folder -> { folder | active = False })
                                    |> map (setFileActiveWithName newTab.text)
                        }
                    , Cmd.none
                    )

        ClickTabBar msg ->
            case msg of
                TabBar.Types.Open tabModel ->
                    ( Debug.log "perse"
                        { model
                            | renderFunction = tabModel.textAreaRenderFunc
                            , textArea = tabModel.textAreaModel
                            , tabs =
                                model.tabs
                                    |> map (\tab -> { tab | active = False })
                                    |> map (setTabActiveWithText tabModel.text)
                            , sideBarFolders =
                                model.sideBarFolders
                                    |> map (\folder -> { folder | active = False })
                                    |> map (setFileActiveWithName tabModel.text)
                        }
                    , Cmd.none
                    )

                TabBar.Types.Close text ->
                    ( let
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
                        { model
                            | tabs = firstTabActive
                            , renderFunction =
                                (head firstTabActive)
                                    |> andThen (\tab -> Just (tab.textAreaRenderFunc))
                                    |> withDefault TextArea.View.Base.view
                            , sideBarFolders = model.sideBarFolders |> map (setFileActiveWithName newActiveTabName)
                        }
                    , Cmd.none
                    )

        OnlyHtml msg ->
            ( model, Cmd.none )

        CvDataFetched (Err e) ->
            let
                err =
                    Debug.log "Error: " e
            in
                ( model
                , Cmd.none
                )

        CvDataFetched (Ok newData) ->
            Debug.log "Data fetch success"
                ( { model
                    | cvData = Just newData
                  }
                , Cmd.none
                )



-- Init


init : ( Model, Cmd Msg )
init =
    ( { sideBarFolders = SideBar.State.init
      , tabs = TabBar.State.init
      , textArea = TextArea.State.init
      , renderFunction = TextArea.View.Base.view
      , cvData = Nothing
      }
    , App.Http.getCvData
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
