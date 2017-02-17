module TextArea.View.Elm exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Html.CssHelpers
import Tuple exposing (first, second)
import List exposing (map)
import TextArea.Styles exposing (..)
import TextArea.Types exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"



-- view : SyntaxRenderFunc
-- view cvModel =
--     div [ class [ TextWrapper ] ]
--         [ h1 [] [ Html.text "elm" ]
--         , renderInfo cvModel.generalInfo
--           -- , renderEmployers model.employers
--           -- , renderLanguages model.languages
--           -- , renderFrameworks model.frameworks
--         ]


generalInfo : SyntaxRenderFunc
generalInfo cvModel =
    let
        info =
            cvModel.generalInfo
    in
        div [ class [ TextWrapper ] ]
            ([ p [] [ text info.name ]
             , p [] [ text (toString info.born) ]
             , p [] [ text info.location ]
             , p [] [ text info.photo ]
             , p [] [ text info.education ]
             ]
                ++ (info.interests
                        |> map
                            (\interest ->
                                p [] [ text interest ]
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
                             ]
                                ++ (language.technologies
                                        |> map
                                            (\technology ->
                                                p [] [ Html.text (technology.name ++ " " ++ toString technology.skill) ]
                                            )
                                   )
                            )
                    )
            )


renderFrameworks : List ( String, Int ) -> Html msg
renderFrameworks fwList =
    div []
        (map
            (\fw ->
                p [] [ text (first fw ++ ": " ++ toString (second fw) ++ "/5") ]
            )
            fwList
        )


renderEmployers : List Employer -> Html msg
renderEmployers employers =
    div []
        (map
            (\employer ->
                div []
                    [ p [] [ text ("Name: " ++ employer.name) ]
                    , p [] [ text ("Tasks: " ++ employer.description) ]
                    , p [] [ text ("Start date: " ++ employer.startDate) ]
                    , p [] [ text ("End date: " ++ employer.endDate) ]
                    ]
            )
            employers
        )
