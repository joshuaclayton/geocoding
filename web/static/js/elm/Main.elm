port module Main exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)


type alias Store =
    { name : String
    , latLong : LatLong
    , phoneNumber : String
    }


type alias LatLong =
    ( Float, Float )


type alias Model =
    { stores : List Store
    , selectedStore : Maybe Store
    }


type alias Flags =
    { locations : List { name : String, lat : Float, long : Float, phone : String }
    }


flagsToModel : Flags -> Model
flagsToModel flags =
    let
        flagToStore f =
            Store f.name ( f.lat, f.long ) f.phone

        stores =
            List.map flagToStore flags.locations
    in
        Model stores Nothing


port initialized : List LatLong -> Cmd a


port selectedStore : Store -> Cmd a


init : Flags -> ( Model, Cmd a )
init flags =
    let
        model =
            flagsToModel flags

        latLngs =
            List.map .latLong model.stores
    in
        ( flagsToModel flags, initialized latLngs )


view : Model -> Html Msg
view model =
    div []
        [ ul [] <| List.map storeEntry model.stores
        , div [ id "map" ] []
        ]


storeEntry : Store -> Html Msg
storeEntry store =
    li [ onClick (Selected store) ] [ text store.name ]


type Msg
    = Selected Store


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        Selected store ->
            ( { model | selectedStore = Just store }, selectedStore store )


main : Program Flags
main =
    Html.App.programWithFlags
        { init = init
        , update = update
        , view = view
        , subscriptions = (\_ -> Sub.none)
        }
