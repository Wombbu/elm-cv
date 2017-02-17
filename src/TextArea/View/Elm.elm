module TextArea.View.Elm exposing (..)

import Html exposing (Html, div, text, p, iframe)
import Html.Attributes exposing (src)
import Html.CssHelpers
import Tuple exposing (first, second)
import List exposing (map)
import TextArea.Styles exposing (..)
import TextArea.Types exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


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


skills : SyntaxRenderFunc
skills cvData =
    let
        languages =
            cvData.languages

        tools =
            cvData.tools
    in
        div [ class [ TextWrapper ] ]
            ((languages
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
                ++ (tools
                        |> map
                            (\tool ->
                                p [] [ Html.text tool ]
                            )
                   )
            )


employers : SyntaxRenderFunc
employers cvData =
    let
        employers =
            cvData.employers
    in
        div [ class [ TextWrapper ] ]
            (employers
                |> map
                    (\employer ->
                        div []
                            ([ p [] [ Html.text ("Name: " ++ employer.name) ]
                             , p [] [ Html.text ("Years " ++ employer.years) ]
                             ]
                                ++ (employer.description
                                        |> map
                                            (\task ->
                                                p [] [ Html.text task ]
                                            )
                                   )
                            )
                    )
            )


projects : SyntaxRenderFunc
projects cvData =
    let
        projects =
            cvData.projects
    in
        div [ class [ TextWrapper ] ]
            (projects
                |> map
                    (\project ->
                        div []
                            [ p [] [ Html.text ("Name: " ++ project.name) ]
                            , p [] [ Html.text ("Explanation: " ++ project.explanation) ]
                            , iframe [ src project.video ] []
                            ]
                    )
            )
