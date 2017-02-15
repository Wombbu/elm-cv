module TextArea.View exposing (view)

import Html exposing (Html)
import Shared.Types exposing (CvData, Syntax(..))
import TextArea.Types exposing (Model, Msg)
import TextArea.View.Base as Base
import TextArea.View.Java as Java
import TextArea.View.Elm as Elm
import TabBar.Types
import Maybe exposing (andThen, withDefault)


view : Model -> Maybe TabBar.Types.Model -> Html Msg
view model maybeTab =
    case maybeTab of
        Just tabModel ->
            case tabModel.syntax of
                Shared.Types.Elm ->
                    Elm.view model

                Shared.Types.Java ->
                    Java.view model

        Nothing ->
            Base.view
