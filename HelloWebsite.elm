-- http://bytefreaks.net/programming-2/elm/an-introduction-to-elm-series-solution-to-buttons-example

import Html exposing (Html, button, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { text : String }


model : Model
model =
  Model ""



-- UPDATE


type Msg
    = Text String
    | ShowIt


update : Msg -> Model -> Model
update msg model =
  case msg of
    Text text ->
      { model | text = text }
    ShowIt ->
      { model | text = "Hello World" }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "text", onInput Text ] []
    , div [] [ text (toString model) ]
    , input [ type_ "button", value "Button", onClick ShowIt ] []
    ]
