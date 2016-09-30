module Main exposing (..)

import Html exposing (..)
import Html.App


type alias Store =
    { name : String
    , latLong : LatLong
    , phoneNumber : String
    }


type alias LatLong =
    ( Float, Float )


type alias Model =
    List Store


type alias Flags =
    { locations : List { name : String, lat : Float, long : Float, phone : String }
    }


flagsToModel : Flags -> Model
flagsToModel flags =
    let
        flagToStore f =
            Store f.name ( f.lat, f.long ) f.phone
    in
        List.map flagToStore flags.locations


init : Flags -> ( Model, Cmd a )
init flags =
    ( flagsToModel flags, Cmd.none )


view : Model -> Html a
view model =
    ul [] <| List.map storeEntry model


storeEntry : Store -> Html a
storeEntry store =
    li [] [ text store.name ]


main : Program Flags
main =
    Html.App.programWithFlags
        { init = init
        , update = (\_ m -> ( m, Cmd.none ))
        , view = view
        , subscriptions = (\_ -> Sub.none)
        }
