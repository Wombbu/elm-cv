module TextArea.View.Java exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Html.CssHelpers
import Tuple exposing (first, second)
import List exposing (map)
import TextArea.Styles exposing (Classes(..), indent, hi)
import TextArea.Types exposing (..)


-- import Css exposing (..)
-- import Shared.Styles exposing (colorTabText, styles, colorBlue, colorTabTextHilight)

import Shared.Types


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


view : SyntaxRenderFunc
view cvModel =
    div [ class [ TextWrapper ] ]
        [ h1 [] [ Html.text "java" ]
        , renderInfo cvModel.generalInfo
          -- , renderEmployers model.employers
          -- , renderLanguages model.languages
          -- , renderFrameworks model.frameworks
        ]


renderInfo : Shared.Types.GeneralInfo -> Html Msg
renderInfo infoList =
    div []
        ([ p [] [ Html.text infoList.name ]
         , p [] [ Html.text (toString infoList.born) ]
         , p [] [ Html.text infoList.location ]
         , p [] [ Html.text infoList.photo ]
         , p [] [ Html.text infoList.education ]
         ]
            ++ (infoList.interests
                    |> map
                        (\interest ->
                            p [] [ Html.text interest ]
                        )
               )
        )


renderLanguages : List ( String, Int ) -> Html msg
renderLanguages languageList =
    div []
        (languageList
            |> map
                (\language ->
                    p [] [ Html.text (Tuple.first language ++ ": " ++ toString (second language) ++ "/5") ]
                )
        )


renderFrameworks : List ( String, Int ) -> Html msg
renderFrameworks fwList =
    div []
        (fwList
            |> map
                (\fw ->
                    p [] [ Html.text (Tuple.first fw ++ ": " ++ toString (second fw) ++ "/5") ]
                )
        )


renderEmployers : List Employer -> Html msg
renderEmployers employers =
    div []
        (employers
            |> map
                (\employer ->
                    div []
                        [ p [] [ Html.text ("Name: " ++ employer.name) ]
                        , p [] [ Html.text ("Tasks: " ++ employer.description) ]
                        , p [] [ Html.text ("Start date: " ++ employer.startDate) ]
                        , p [] [ Html.text ("End date: " ++ employer.endDate) ]
                        ]
                )
        )
