module App.State exposing (..)

import Requests.CvData
import Maybe exposing (withDefault, andThen)
import List exposing (filter, head, map)
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
                            , sideBarFolders =
                                model.sideBarFolders
                                    |> map (\folder -> { folder | active = False })
                                    |> map (setFileActiveWithName newTab.text)
                            , activeTab = Just newTab
                        }
                    , Cmd.none
                    )

        ClickTabBar msg ->
            case msg of
                TabBar.Types.Open tabModel ->
                    ( { model
                        | cvData = tabModel.cvModel
                        , tabs =
                            model.tabs
                                |> map (\tab -> { tab | active = False })
                                |> map (setTabActiveWithText tabModel.text)
                        , sideBarFolders =
                            model.sideBarFolders
                                |> map (\folder -> { folder | active = False })
                                |> map (setFileActiveWithName tabModel.text)
                        , activeTab = Just tabModel
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
                            , sideBarFolders = model.sideBarFolders |> map (setFileActiveWithName newActiveTabName)
                            , activeTab = head model.tabs
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
            ( { model
                | cvData = Just newData
                , sideBarFolders =
                    model.sideBarFolders
                        |> map
                            (SideBar.State.goThroughAllFiles
                                (\file -> { file | cvData = Just newData })
                            )
              }
            , Cmd.none
            )



-- Init


init : ( Model, Cmd Msg )
init =
    ( { sideBarFolders = SideBar.State.init
      , tabs = TabBar.State.init
      , cvData = Nothing
      , activeTab = Nothing
      }
    , Requests.CvData.get
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
