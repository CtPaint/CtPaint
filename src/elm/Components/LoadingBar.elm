module Components.LoadingBar exposing (render)


import Html            exposing (..)
import Html.Attributes exposing (class, style, type_, value)
import Html.Events     exposing (on, onInput, keyCode, onMouseDown)

import Types.Message   exposing (Msg(..))

import View.Util       exposing (classes)


render : Float -> Html Msg
render percent = 
  let
    numberOfBlocks =
      round (percent * 33)
  in
    List.repeat numberOfBlocks block
    |> div [ class "loading-bar"]


block : Html Msg
block =
  div [ class "loading-block" ] []