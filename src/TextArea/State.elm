module TextArea.State exposing (init)

import TextArea.Types exposing (..)


-- Init


init : Model
init =
    { info = initInfo
    , languages = initLanguages
    , frameworks = initFrameworks
    , employers = initEmployers
    , projects = initProjects
    }


initInfo : List ( String, String )
initInfo =
    [ ( "Name", "Lauri Nevanperä" )
    , ( "Born", "1990" )
    , ( "Education", "Bachelor of Business" )
    ]


initLanguages : List ( String, Int )
initLanguages =
    [ ( "Java", 4 )
    , ( "ES6", 4 )
    , ( "elm", 3 )
    ]


initFrameworks : List ( String, Int )
initFrameworks =
    [ ( "Angular 1", 4 )
    , ( "Angular 2", 3 )
    , ( "Jersey", 3 )
    , ( "CreateJS", 4 )
    , ( "React Native", 2 )
    ]


initEmployers : List Employer
initEmployers =
    [ { name = "Elisa"
      , description = "Made stuff"
      , startDate = "05/2016"
      , endDate = "08/2016"
      }
    , { name = "Sasken"
      , description = "Made other stuff"
      , startDate = "09/2016"
      , endDate = "Present"
      }
    ]


initProjects : List Project
initProjects =
    [ { videos = [ "www.youtube.com", "www.vimeo.com" ]
      , description = "Juuh elicks"
      , imageUrl = "www.imgur.com"
      }
    , { videos = [ "www.youtube.com", "www.vimeo.com" ]
      , description = "Juuh elicks 2"
      , imageUrl = "www.imgur.com"
      }
    ]
