module TextArea.View exposing (view)

import Html exposing (Html)
import Shared.Types exposing (CvData, Syntax(..), Info, Info(..))
import TextArea.Types exposing (Model, Msg, SyntaxRenderFunc)
import TextArea.View.Base as Base
import TextArea.View.Java as Java
import TextArea.View.Elm as Elm
import TabBar.Types
import Maybe exposing (andThen, withDefault)


view : Maybe TabBar.Types.Model -> Html Msg
view maybeTab =
    maybeTab
        |> andThen
            (\model ->
                Just
                    (model.cvModel
                        |> andThen
                            (\cvModel ->
                                Just <|
                                    getRenderFunc model.syntax model.info <|
                                        cvModel
                            )
                        |> withDefault Base.view
                    )
            )
        |> withDefault Base.view


getRenderFunc : Syntax -> Info -> SyntaxRenderFunc
getRenderFunc syntax info =
    case syntax of
        Shared.Types.Java ->
            case info of
                General ->
                    Java.generalInfo

                Projects ->
                    Java.generalInfo

                Employers ->
                    Java.generalInfo

                Skills ->
                    Java.languages

        Shared.Types.Elm ->
            case info of
                General ->
                    Elm.generalInfo

                Projects ->
                    Elm.generalInfo

                Employers ->
                    Elm.generalInfo

                Skills ->
                    Elm.languages
