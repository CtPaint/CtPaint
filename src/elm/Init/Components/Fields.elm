module Init.Components.Fields exposing (..)


import Html            exposing (Html, div, p, text, input)
import Html.Attributes exposing (class, style, value, placeholder)
import Html.Events     exposing (onInput)
import Message         exposing (Msg(..))
import Init.Types      exposing (SetUpMsg(..))
import View.Util       exposing (classes)



name : String -> Html Msg
name n =
  input
  [ classes [ "field", "width-200" ]
  , placeholder "project name"
  , value n
  , onInput (SetUp << SetProjectName)
  ] []

  |> row "name"


width : Int -> Html Msg
width w =
  input
  [ classes [ "field", "width-65" ]
  , placeholder "px"
  , value (toString w)
  , onInput (SetUp << SetProjectWidth)
  ] []

  |> row "width"


height : Int -> Html Msg
height h =
  input
  [ classes [ "field", "width-65" ]
  , placeholder "px"
  , value (toString h)
  , onInput (SetUp << SetProjectHeight)
  ] []

  |> row "height"



row : String -> Html Msg -> Html Msg
row name input =
  div
  [ class "form-row" ]
  [ div
    [ class "form-field" ]
    [ p
      [ classes [ "point", "form" ] ]
      [ text name ]
    ]
  , div
    [ class "form-input" ]
    [ input ]
  ]


