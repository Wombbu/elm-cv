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
import Shared.Styles exposing (styles, colorTextMain)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"



-- General


classHeader : String -> List ( String, String ) -> List (Html msg)
classHeader className params =
    [ p []
        (([ span [ styles [ float left, color colorPurpleHilight ] ] [ Html.text ("public class") ]
          , span [ styles [ float left, color colorHilightYellow, indentMixin 1 ] ] [ Html.text (className) ]
          , span [ styles [ float left ] ] [ Html.text "(" ]
          ]
            ++ renderParams params
         )
            ++ [ span [ styles [ float left, indentMixin 1 ] ] [ Html.text ") {" ]
               , br [] []
               ]
        )
    ]


renderParams : List ( String, String ) -> List (Html msg)
renderParams params =
    (params
        |> map
            (\param ->
                div []
                    -- Todo take the first from the list and render it and the rest of the list separetelly
                    [ span [ styles [ float left, color colorHilightYellow, indentMixin 1 ] ] [ Html.text (Tuple.first param) ]
                    , span [ styles [ float left, indentMixin 1 ] ] [ Html.text ((Tuple.second param) ++ ",") ]
                    ]
            )
    )


closingBracket : List (Html msg)
closingBracket =
    [ p [] [ Html.text "}" ] ]


renderClass : String -> List ( String, String ) -> List (Html msg) -> Html msg
renderClass name arguments content =
    div [ class [ TextWrapper ] ]
        (classHeader name arguments
            ++ [ div [ indent 2 ] content ]
            ++ closingBracket
        )


syntaxHilight : List ( String, Color ) -> Html msg
syntaxHilight wordsAndColors =
    p []
        (wordsAndColors
            |> map
                (\wordAndColor ->
                    span [ styles [ color (Tuple.second wordAndColor) ] ]
                        [ Html.text (Tuple.first wordAndColor) ]
                )
        )


variable : String -> String -> List ( String, Color ) -> Html msg
variable typeName name wordsAndColors =
    syntaxHilight
        ([ ( "private ", colorPurpleHilight )
         , ( typeName, colorRedHilight )
         , ( name, colorHilightYellow )
         , ( " = ", colorTextMain )
         ]
            ++ wordsAndColors
            ++ [ ( ";", colorTextMain ) ]
        )


string : String -> String -> Html msg
string name value =
    variable
        "String "
        name
        [ ( "\"" ++ value ++ "\"", colorGreenHilight ) ]


newClass : String -> String -> List ( String, Color ) -> Html msg
newClass typeName name params =
    variable
        typeName
        name
        ([ ( "new ", colorPurpleHilight )
         , ( typeName, colorHilightYellow )
         , ( "(", colorTextMain )
         ]
            ++ (params
                    |> map (\param -> ( Tuple.first param, Tuple.second param ))
               )
            ++ [ ( ")", colorTextMain ) ]
        )


newArray : String -> String -> String -> List ( String, Color ) -> Html msg
newArray prefix typeName name content =
    div []
        [ syntaxHilight
            [ ( prefix ++ " ", colorPurpleHilight )
            , ( typeName ++ " ", colorRedHilight )
            , ( name, colorHilightYellow )
            , ( " = ", colorTextMain )
            ]
        , div [ indent 2 ]
            ([ p [] [ Html.text "{" ] ]
                ++ (content
                        |> map (\entry -> syntaxHilight [ entry ])
                   )
                ++ [ p [] [ Html.text "};" ] ]
            )
        ]


generalInfo : SyntaxRenderFunc
generalInfo cvData =
    let
        info =
            cvData.generalInfo
    in
        renderClass "Info"
            [ ( "Juuh", "eiss" ), ( "Voiv", "hele" ) ]
            ([ (string "name" info.name)
               --  , p [] [ Html.text (toString info.born) ]
             , (newClass "Date" " birthday" [ ( "\"" ++ info.born ++ "\"", colorGreenHilight ) ])
             , (string "location" info.location)
             , p [] [ Html.text info.photo ]
             , (string "education" info.education)
             , newArray "private" "String" "interests" (info.interests |> map (\interest -> ( "\"" ++ interest ++ "\"", colorGreenHilight )))
             ]
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
        renderClass "Skills"
            [ ( "Juuh", "elicks" ), ( "Eiss", "eiss" ) ]
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
        renderClass "Skills"
            [ ( "Juuh", "elicks" ), ( "Eiss", "eiss" ) ]
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
        renderClass "Skills"
            [ ( "Juuh", "elicks" ), ( "Eiss", "eiss" ) ]
            ((projects
                |> map
                    (\project ->
                        div []
                            [ p [] [ Html.text ("Name: " ++ project.name) ]
                            , p [] [ Html.text ("Explanation: " ++ project.explanation) ]
                            , iframe [ Attr.src project.video ] []
                            ]
                    )
             )
            )



-- Colors


colorHilightYellow : Color
colorHilightYellow =
    rgb 229 192 123


colorPurpleHilight : Color
colorPurpleHilight =
    rgb 198 120 221


colorBlueHilight : Color
colorBlueHilight =
    rgb 95 171 233


colorRedHilight : Color
colorRedHilight =
    rgb 224 108 117


colorGreenHilight : Color
colorGreenHilight =
    rgb 152 195 121
