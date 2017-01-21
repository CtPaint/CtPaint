module Init.View exposing (view)


import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (on, onInput, keyCode, onMouseDown)

import Types.Model     exposing (UninitializedState)
import Types.Message   exposing (Msg(..))



view : UninitializedState -> Html Msg
view state =
  div [] []