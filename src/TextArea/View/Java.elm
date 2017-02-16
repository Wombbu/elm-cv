module TextArea.View.Java exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Html.CssHelpers
import Tuple exposing (first, second)
import List exposing (map)
import TextArea.Styles exposing (Classes(..), indent, hi)
import TextArea.Types exposing (..)


-- import Css exposing (..)
-- import Shared.Styles exposing (colorTabText, styles, colorBlue, colorTabTextHilight)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"



-- view : SyntaxRenderFunc
-- view cvModel =
--     div [ class [ TextWrapper ] ]
--         [ h1 [] [ Html.text "java" ]
--         , renderInfo cvModel.generalInfo
--           -- , renderEmployers model.employers
--           -- , renderLanguages model.languages
--           -- , renderFrameworks model.frameworks
--         ]


generalInfo : SyntaxRenderFunc
generalInfo cvData =
    let
        info =
            cvData.generalInfo
    in
        div [ class [ TextWrapper ] ]
            ([ p [] [ Html.text info.name ]
             , p [] [ Html.text (toString info.born) ]
             , p [] [ Html.text info.location ]
             , p [] [ Html.text info.photo ]
             , p [] [ Html.text info.education ]
             ]
                ++ (info.interests
                        |> map
                            (\interest ->
                                p [] [ Html.text interest ]
                            )
                   )
            )


languages : SyntaxRenderFunc
languages cvData =
    let
        languages =
            cvData.languages
    in
        div [ class [ TextWrapper ] ]
            (languages
                |> map
                    (\language ->
                        div []
                            ([ p [] [ Html.text language.language ]
                             , p [] [ Html.text ("Skill: " ++ (toString language.skill)) ]
                             ]
                                ++ (language.technologies
                                        |> map
                                            (\technology ->
                                                p [] [ Html.text technology ]
                                            )
                                   )
                            )
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
