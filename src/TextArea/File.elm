module TextArea.File exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Events exposing (..)
import TextArea.Types as Types


-- Init


initFile : Types.File
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


  -- Render


renderJava : Types.File -> Html Types.Msg
renderJava model =
  div []
  [ h1 [onClick Types.Click] [ text "Java" ]
  ]
