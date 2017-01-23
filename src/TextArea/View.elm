module TextArea.View exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
-- import Html.Events exposing (..)
import Tuple exposing (first, second)
import List exposing (map)

import TextArea.Types exposing (..)


java : TextArea.Types.Model -> Html TextArea.Types.Msg
java model =
  div []
  [
    renderInfo model.info,
    renderLanguages model.languages,
    renderFrameworks model.frameworks,
    renderEmployers model.employers
  ]


renderInfo : List (String, String) -> Html msg
renderInfo infoList =
  div []
    (map (\info ->
        p [] [ text ( first info ++ "     " ++ second info ) ]
      )
      infoList)


renderLanguages : List (String, Int) -> Html msg
renderLanguages languageList =
  div []
    (map (\language ->
        p [] [ text ( first language ++ ": " ++ toString (second language) ++ "/5" ) ]
      )
      languageList)


renderFrameworks : List (String, Int) -> Html msg
renderFrameworks fwList =
  div []
    (map (\fw ->
        p [] [ text ( first fw ++ ": " ++ toString (second fw) ++ "/5" ) ]
      )
      fwList)


renderEmployers : List Employer -> Html msg
renderEmployers employers =
  div []
    (map (\employer ->
      div []
      [
        p [] [ text ("Name: " ++ employer.name)],
        p [] [ text ("Tasks: " ++ employer.description)],
        p [] [ text ("Start date: " ++ employer.startDate)],
        p [] [ text ("End date: " ++ employer.endDate)]
      ]
    ) employers)
