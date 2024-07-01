module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Char exposing (isDigit, isLower, isUpper)
import Html exposing (Html, a, div, input, label, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


init : Model
init =
    -- short-hand for {name="", password=""...etc}
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain passwordAgain ->
            { model | passwordAgain = passwordAgain }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ viewInput "Name" "text" "Name" model.name Name
        , viewInput "Password" "password" "Password" model.password Password
        , viewInput "PasswordAgain" "password" "Re-enter Password" model.passwordAgain PasswordAgain
        , viewValidation model
        ]


viewInput : String -> String -> String -> String -> (String -> msg) -> Html msg
viewInput l t p v toMsg =
    let
        j =
            l ++ ": "
    in
    label [ for l ]
        [ text j
        , input [ id l, type_ t, placeholder p, value v, onInput toMsg ] []
        ]


viewValidation : Model -> Html Msg
viewValidation model =
    if String.length model.password <= 0 then
        div [] []

    else if String.length model.password < 8 then
        div [ style "color" "red" ] [ text "Password needs to be more than 8 character long" ]

    else if String.any isUpper model.password then
        div [ style "color" "RED" ] [ text "Password must contain atleast one uppercase letter A..Z" ]

    else if String.any isDigit model.password then
        div [ style "color" "RED" ] [ text "Password must contain atleast one numeric character 1..9" ]

    else if String.any isLower model.password then
        div [ style "color" "RED" ] [ text "Password must contain atleast one lowercase letter a..z" ]

    else if String.length model.password /= String.length model.passwordAgain then
        div [ style "color" "RED" ] [ text "Passwords do not match" ]

    else if model.password == model.passwordAgain then
        div [ style "color" "green" ] [ text "OK" ]

    else
        div [] []
