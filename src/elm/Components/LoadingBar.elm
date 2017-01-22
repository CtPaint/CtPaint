module Components.LoadingBar exposing (render)


import Html            exposing (..)
import Html.Attributes exposing (class)
import Types.Message   exposing (Msg(..))



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