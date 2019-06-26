module Main exposing (main, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- simpliest version of an elm app
-- lives in `sandbox`
-- not talking to the outside world eg. http req, js interops


main =
    Browser.sandbox
        { init = init -- initial model
        , view = view
        , update = update
        }



-- model
-- representation for the state of the program


type alias Model =
    { count : Int }


init : Model
init =
    { count = 0 }



-- view


type Msg
    = Inc
    | Dec


view : Model -> Html Msg
view model =
    section [ name "counter" ]
        [ text (String.fromInt model.count)
        , button [ onClick Dec ] [ text "-" ]
        , button [ onClick Inc ] [ text "+" ]
        ]



-- update


update : Msg -> Model -> Model
update msg model =
    case msg of
        Inc ->
            { model | count = model.count + 1 }

        Dec ->
            { model | count = model.count - 1 }
