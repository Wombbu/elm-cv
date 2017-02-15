module App.Http exposing (getCvData)

import Http
import Json.Decode as Decode exposing (int, string, field, list)
import App.Types as Types exposing (Msg(..))


getCvData : Cmd Types.Msg
getCvData =
    Http.send
        CvDataFetched
        (Http.get "./combined.json" decodeCvData)


decodeCvData : Decode.Decoder Types.CvData
decodeCvData =
    Decode.map5 Types.CvData
        (field "info" decodeInfo)
        (field "projects" (list decodeProjects))
        (field "employers" (list decodeEmployers))
        (field "languages" (list decodeLanguages))
        (field "tools" (list string))


decodeInfo : Decode.Decoder Types.Info
decodeInfo =
    Decode.map6 Types.Info
        (field "name" string)
        (field "born" int)
        (field "interests" (list string))
        (field "location" string)
        (field "photo" string)
        (field "education" string)


decodeProjects : Decode.Decoder Types.Project
decodeProjects =
    Decode.map3 Types.Project
        (field "name" string)
        (field "video" string)
        (field "explanation" string)


decodeEmployers : Decode.Decoder Types.Employer
decodeEmployers =
    Decode.map2 Types.Employer
        (field "name" string)
        (field "description" (list string))


decodeLanguages : Decode.Decoder Types.Language
decodeLanguages =
    Decode.map3 Types.Language
        (field "language" string)
        (field "technologies" (list string))
        (field "skill" int)
