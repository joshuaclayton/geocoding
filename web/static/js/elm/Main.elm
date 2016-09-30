module Main exposing (..)

import Html exposing (..)
import Html.App


main : Program Never
main =
    Html.App.program
        { init = ( "", Cmd.none )
        , update = (\_ m -> ( m, Cmd.none ))
        , view = (\_ -> div [] [ text "well, hello world" ])
        , subscriptions = (\_ -> Sub.none)
        }
