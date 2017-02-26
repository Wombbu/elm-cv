module Requests.CvData exposing (get)

import Http
import Json.Decode as Decode exposing (int, string, bool, list, Decoder)
import Shared.Types as Types
import App.Types exposing (Msg(..))
import Json.Decode.Pipeline exposing (optional, decode, required)


get : Cmd Msg
get =
    Http.send
        CvDataFetched
        (Http.get "./cv-data.json" decodeCvData)


decodeCvData : Decoder Types.CvData
decodeCvData =
    decode Types.CvData
        |> required "info" decodeInfo
        |> required "projects" (list decodeProjects)
        |> required "employers" (list decodeEmployers)
        |> required "languages" (list decodeLanguages)
        |> required "tools" (list string)


decodeInfo : Decoder Types.GeneralInfo
decodeInfo =
    decode Types.GeneralInfo
        |> required "name" string
        |> required "born" string
        |> required "interests" (list string)
        |> required "location" string
        |> required "photo" string
        |> required "education" string


decodeProjects : Decoder Types.Project
decodeProjects =
    decode Types.Project
        |> required "name" string
        |> required "video" string
        |> required "explanation" string
        |> optional "expanded" bool False


decodeEmployers : Decoder Types.Employer
decodeEmployers =
    decode Types.Employer
        |> required "name" string
        |> required "description" (list string)
        |> required "years" string


decodeLanguages : Decoder Types.Language
decodeLanguages =
    decode Types.Language
        |> required "language" string
        |> required "technologies" (list decodeTechnologies)
        |> optional "expanded" bool False


decodeTechnologies : Decoder Types.TechnologyAndSkill
decodeTechnologies =
    decode Types.TechnologyAndSkill
        |> required "name" string
        |> required "skill" int
