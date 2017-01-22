module TextArea.State exposing (..)

import TextArea.Types


-- Init


initFile : TextArea.Types.Model
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
