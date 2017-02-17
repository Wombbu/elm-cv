module TextArea.View.Elm exposing (..)

import Html exposing (Html, div, text, p, iframe)
import Html.Attributes as Attr
import Html.CssHelpers
import List exposing (map)
import Shared.Types exposing (Language, TechnologyAndSkill, Employer)
import TextArea.Styles exposing (..)
import TextArea.Types exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


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
                ++ renderInterests info.interests
            )


renderInterests : List String -> List (Html msg)
renderInterests interests =
    interests
        |> map
            (\interest ->
                p [] [ Html.text interest ]
            )



-- Skills


skills : SyntaxRenderFunc
skills cvData =
    let
        languages =
            cvData.languages

        tools =
            cvData.tools
    in
        div [ class [ TextWrapper ] ]
            (renderLanguages languages
                ++ renderTools tools
            )


renderLanguages : List Language -> List (Html msg)
renderLanguages languages =
    languages
        |> map
            (\language ->
                div []
                    ([ p [] [ Html.text language.language ] ]
                        ++ renderLanguageTechnologies language.technologies
                    )
            )


renderLanguageTechnologies : List TechnologyAndSkill -> List (Html msg)
renderLanguageTechnologies technologies =
    technologies
        |> map
            (\technology ->
                p [] [ Html.text (technology.name ++ " " ++ toString technology.skill) ]
            )


renderTools : List String -> List (Html msg)
renderTools tools =
    tools
        |> map
            (\tool ->
                p [] [ Html.text tool ]
            )



-- Employers


employers : SyntaxRenderFunc
employers cvData =
    let
        employers =
            cvData.employers
    in
        div [ class [ TextWrapper ] ]
            (renderEmployers employers)


renderEmployers : List Employer -> List (Html msg)
renderEmployers employers =
    employers
        |> map
            (\employer ->
                div []
                    ([ p [] [ Html.text ("Name: " ++ employer.name) ]
                     , p [] [ Html.text ("Years " ++ employer.years) ]
                     ]
                        ++ renderEmployerDescription employer.description
                    )
            )


renderEmployerDescription : List String -> List (Html msg)
renderEmployerDescription descriptions =
    descriptions
        |> map
            (\task ->
                p [] [ Html.text task ]
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
                            , iframe [ Attr.src project.video ] []
                            ]
                    )
            )
