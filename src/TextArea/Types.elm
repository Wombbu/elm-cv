module TextArea.Types exposing (..)

type alias Model =
  { info : List (String, String)
  , languages : List (String, Int)
  , frameworks : List (String, Int)
  , employers : List Employer
  , projects : List Project
  }


type alias Employer =
  { employerName : String
  , description : String
  , startDate : Int
  , endDate : Int
  }


type alias Project =
  { videos : List String
  , description : String
  , imageUrl : String
  }


type Msg =
    Click
