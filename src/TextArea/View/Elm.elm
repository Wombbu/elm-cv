module TextArea.View.Elm exposing (..)

import Html exposing (Html, div, h1, text, ul, li, p)
import Html.CssHelpers
import Tuple exposing (first, second)
import List exposing (map)
import TextArea.Styles exposing (..)
import TextArea.Types exposing (..)
import Shared.Types
import Maybe exposing (andThen, withDefault)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "text-area"


view : SyntaxRenderFunc
view cvModel =
    div [ class [ TextWrapper ] ]
        [ h1 [] [ Html.text "elm" ]
        , renderInfo cvModel.generalInfo
          -- , renderEmployers model.employers
          -- , renderLanguages model.languages
          -- , renderFrameworks model.frameworks
        ]


renderInfo : Shared.Types.GeneralInfo -> Html Msg
renderInfo infoList =
    div []
        ([ p [] [ text infoList.name ]
         , p [] [ text (toString infoList.born) ]
         , p [] [ text infoList.location ]
         , p [] [ text infoList.photo ]
         , p [] [ text infoList.education ]
         ]
            ++ (infoList.interests
                    |> map
                        (\interest ->
                            p [] [ text interest ]
                        )
               )
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
