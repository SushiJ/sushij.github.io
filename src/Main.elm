module Main exposing (Model, main, view)

import Browser
import Html exposing (Html, a, div, li, text, ul)
import Html.Attributes exposing (..)



-- MAIN
--


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }


type Model
    = Nothing


type Msg
    = Never


init : Model
init =
    Nothing


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Html Msg
view _ =
    ul []
        [ li [] [ a [ href "https://sushij.github.io/portfolio/resume.pdf", target "_blank" ] [ text "Resume" ] ]
        , li [] [ a [ href "https://sushij.github.io/portfolio", target "_blank" ] [ text "Portfolio" ] ]
        , li [] [ a [ href "https://sushi-cv.vercel.app", target "_blank" ] [ text "CV" ] ]
        , li [] [ a [ href "https://github.com/sushij", target "_blank" ] [ text "Github" ] ]
        , li [] [ a [ href "https://www.linkedin.com/in/sushantsharma23", target "_blank" ] [ text "LinkedIn" ] ]
        ]
