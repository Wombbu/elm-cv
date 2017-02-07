module TextArea.View.Java exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Html.CssHelpers
import Tuple exposing (first, second)
import List exposing (map)
import TextArea.Styles exposing ( Classes(..), indent, hi )
import TextArea.Types exposing (..)
import Css exposing (..)
import Shared.Styles exposing (colorTabText, styles, colorBlue, colorTabTextHilight)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


view : SyntaxRenderFunc
view model =
  div [ class [ TextWrapper ] ]
  [ p [][ hi "public class" colorBlue, hi " Info" colorTabTextHilight, Html.text " {" ]
  , div[indent 2]
    [
      renderInfo model.info,
      renderEmployers model.employers,
      renderLanguages model.languages,
      renderFrameworks model.frameworks
    ]
  , p [] [ Html.text "}" ]
  ]


renderInfo : List (String, String) -> Html msg
renderInfo infoList =
  div [styles [paddingBottom ( em 1 )]]
    (p [] [hi "private final String" colorBlue, Html.text " LIFE_PREFIX = ", hi "\"NO\"" colorTabTextHilight, Html.text ";"] ::
    (infoList |> map
      (\info ->
        p [styles [ color colorTabText ] ] [ Html.text ("//" ++ Tuple.first info ++ ": " ++ second info ) ]
      )
    ))


renderLanguages : List (String, Int) -> Html msg
renderLanguages languageList =
  div []
    (languageList |> map (\language ->
        p [] [ Html.text ( Tuple.first language ++ ": " ++ toString (second language) ++ "/5" ) ]
      )
    )


renderFrameworks : List (String, Int) -> Html msg
renderFrameworks fwList =
  div []
    (fwList |> map (\fw ->
        p [] [ Html.text ( Tuple.first fw ++ ": " ++ toString (second fw) ++ "/5" ) ]
      )
    )


renderEmployers : List Employer -> Html msg
renderEmployers employers =
  div []
    (employers |> map (\employer ->
        div []
        [
          p [] [ Html.text ("Name: " ++ employer.name)],
          p [] [ Html.text ("Tasks: " ++ employer.description)],
          p [] [ Html.text ("Start date: " ++ employer.startDate)],
          p [] [ Html.text ("End date: " ++ employer.endDate)]
        ]
      )
    )
