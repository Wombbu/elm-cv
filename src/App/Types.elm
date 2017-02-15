module App.Types exposing (..)

import Html exposing (Html)
import Http
import TextArea.Types
import TabBar.Types
import SideBar.Types
import Requests.Types exposing (CvData)


type Msg
    = ClickTextArea TextArea.Types.Msg
    | ClickSideBar SideBar.Types.Msg
    | ClickTabBar TabBar.Types.Msg
    | CvDataFetched (Result Http.Error CvData)
    | OnlyHtml ()


type alias Model =
    { sideBarFolders : List SideBar.Types.Model
    , tabs : List TabBar.Types.Model
    , textArea : TextArea.Types.Model
    , renderFunction :
        TextArea.Types.Model -> Html TextArea.Types.Msg
    , cvData : Maybe CvData
    , activeTab : Maybe TabBar.Types.Model
    }
