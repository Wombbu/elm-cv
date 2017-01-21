module File exposing (..)


-- Types


type alias Employer =
  { employerName : String
  , description : String
  , startDate : Int
  , endDate : Int }

type alias Project =
  { videos : List String
  , description : String
  , imageUrl : String }

type alias File =
  { employers : List Employer
  , projects : List Project
  }


-- Init


initFile : File
initFile =
  { employers =
    [ { employerName = "Elisa"
    , description = "Made stuff"
    , startDate = 999999
    , endDate = 999999 },
    { employerName = "Sasken"
    , description = "Made other stuff"
    , startDate = 888888
    , endDate = 8888888 } ]
  , projects =
    [ { videos = ["www.youtube.com", "www.vimeo.com"]
    , description = "Juuh elicks"
    , imageUrl = "www.imgur.com" },
    { videos = ["www.youtube.com", "www.vimeo.com"]
    , description = "Juuh elicks 2"
    , imageUrl = "www.imgur.com" } ]
  }
