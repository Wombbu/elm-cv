module App.Types exposing (..)

import Html exposing (Html)
import Http
import TextArea.Types
import TabBar.Types
import SideBar.Types


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
    }


type alias CvData =
    { info : Info
    , projects : List Project
    , employers : List Employer
    , languages : List Language
    , tools : List String
    }


type alias Info =
    { name : String
    , born : Int
    , interests : List String
    , location : String
    , photo : String
    , education : String
    }


type alias Project =
    { name : String
    , video : String
    , explanation : String
    }


type alias Employer =
    { name : String
    , description : List String
    }


type alias Language =
    { language : String
    , technologies : List String
    , skill : Int
    }
