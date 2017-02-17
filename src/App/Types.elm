module App.Types exposing (..)

import Http
import TextArea.Types
import TabBar.Types
import SideBar.Types
import Shared.Types exposing (CvData)


type Msg
    = ClickTextArea TextArea.Types.Msg
    | ClickSideBar SideBar.Types.Msg
    | ClickTabBar TabBar.Types.Msg
    | CvDataFetched (Result Http.Error CvData)
    | OnlyHtml ()


type alias Model =
    { sideBarFolders : List SideBar.Types.Model
    , tabs : List TabBar.Types.Model
    , cvData : Maybe CvData
    , activeTab : Maybe TabBar.Types.Model
    }
