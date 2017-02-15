module Shared.Types exposing (..)


type Syntax
    = Java
    | Elm


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
    , expanded : Bool
    }


type alias Employer =
    { name : String
    , description : List String
    }


type alias Language =
    { language : String
    , technologies : List String
    , skill : Int
    , expanded : Bool
    }
