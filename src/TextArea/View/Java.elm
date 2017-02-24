module TextArea.View.Java exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p, iframe, span, br)
import Html.Attributes as Attr
import Html.CssHelpers
import Css exposing (..)
import List exposing (map)
import TextArea.Styles exposing (Classes(..), indent, indentMixin, hi)
import TextArea.Types exposing (..)
import Shared.Types exposing (Language, TechnologyAndSkill, Employer)
import Tuple
import Shared.Styles exposing (colorTabText, styles, colorBlue, colorTabTextHilight, colorTabCloseActive)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"



-- General


renderClassHeader : String -> List ( String, String ) -> Html msg
renderClassHeader className params =
    p []
        (([ span [ styles [ float left ] ] [ Html.text ("public class") ]
          , span [ styles [ float left, color colorBlue, indentMixin 1 ] ] [ Html.text (className) ]
          , span [ styles [ float left ] ] [ Html.text "(" ]
          ]
            ++ (params
                    |> map
                        (\param ->
                            div [ indent 4 ]
                                -- Todo take the first from the list and render it and the rest of the list separetelly
                                [ span [ styles [ float left, color colorTabCloseActive, indentMixin 1 ] ] [ Html.text (Tuple.first param) ]
                                , span [ styles [ float left, indentMixin 1 ] ] [ Html.text ((Tuple.second param) ++ ",") ]
                                ]
                        )
               )
         )
            ++ [ span [ styles [ float left, indentMixin 1 ] ] [ Html.text ") {" ]
               , br [] []
               ]
        )



-- Info


generalInfo : SyntaxRenderFunc
generalInfo cvData =
    let
        info =
            cvData.generalInfo
    in
        div [ class [ TextWrapper ] ]
            ([ (renderClassHeader "Info" [ ( "Juuh", "juuh" ), ( "Eiss", "eiss" ) ]) ]
                ++ [ p [] [ Html.text info.name ]
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
