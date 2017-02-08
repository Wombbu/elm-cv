module TextArea.View.Elm exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Html.CssHelpers
import Tuple exposing (first, second)
import List exposing (map)
import TextArea.Styles exposing (..)
import TextArea.Types exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


view : SyntaxRenderFunc
view model =
    div [ class [ TextWrapper ] ]
        [ h1 [] [ Html.text "elm" ]
        , renderInfo model.info
        , renderEmployers model.employers
        , renderLanguages model.languages
        , renderFrameworks model.frameworks
        ]


renderInfo : List ( String, String ) -> Html msg
renderInfo infoList =
    div []
        (map
            (\info ->
                p [] [ text (first info ++ "     " ++ second info) ]
            )
            infoList
        )


renderLanguages : List ( String, Int ) -> Html msg
renderLanguages languageList =
    div []
        (map
            (\language ->
                p [] [ text (first language ++ ": " ++ toString (second language) ++ "/5") ]
            )
            languageList
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
