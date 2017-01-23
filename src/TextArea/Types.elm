module TextArea.Types exposing (..)

import Html exposing (Html)

type alias Model =
  { info : List (String, String)
  , languages : List (String, Int)
  , frameworks : List (String, Int)
  , employers : List Employer
  , projects : List Project
  }


type alias Employer =
  { name : String
  , description : String
  , startDate : String
  , endDate : String
  }


type alias Project =
  { videos : List String
  , description : String
  , imageUrl : String
  }


type Msg =
    Click

type alias SyntaxRenderFunc =
  Model -> Html Msg
