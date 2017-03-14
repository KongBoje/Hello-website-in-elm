-- Read all about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/forms.html

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main =
  Html.beginnerProgram
    { model = createModel
    , view = showView
    , update = doUpdate
    }



-- MODEL


type alias Model =
  { count : Int }


createModel : Model
createModel =
  Model 0



-- UPDATE


type Message -- type does not exist unless we define it together
    = Click
    | Increment
    | Decrement


doUpdate : Message -> Model -> Model
doUpdate msg model =
  case msg of
    Click -> model

    Increment ->
      {model | count = model.count + 1}

    Decrement ->
      {model | count = model.count - 1}



-- VIEW


showView : Model -> Html Message --type
showView model =
   div []
     (  [ input [ type_ "button", value "inc", onClick Increment ] []
        , input [ type_ "button", value "dec", onClick Decrement ] []
        ] ++
        List.map makeLine (List.range 0 model.count)
     )



makeLine : Int -> Html msg
makeLine n =
  div [] [ text ("this is line " ++ (toString n)) ]

{--
viewValidation : Model -> Html msg --type variable
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordAgain then
        ("green", "OK")
      else
        ("red", "Passwords do not match!")
  in
    div [ style [("color", color)] ] [ text message ]
--}
