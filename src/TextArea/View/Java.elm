module TextArea.View.Java exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p, iframe)
import Html.Attributes exposing (src)
import Html.CssHelpers
import List exposing (map)
import TextArea.Styles exposing (Classes(..), indent, hi)
import TextArea.Types exposing (..)


-- import Css exposing (..)
-- import Shared.Styles exposing (colorTabText, styles, colorBlue, colorTabTextHilight)


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
                ++ (info.interests
                        |> map
                            (\interest ->
                                p [] [ Html.text interest ]
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
