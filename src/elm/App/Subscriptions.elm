module App.Subscriptions exposing (subscriptions)


import Model   exposing (Model(..), State)
import Message exposing (Msg(OnWindowResize, Tick, Keyboard))
import Mouse   exposing (Position)
import Window  exposing (resizes)
import AnimationFrame exposing (diffs)
import Keyboard as K
import Keyboard.Types exposing (KeyboardDir(..))



subscriptions : State -> Sub Msg
subscriptions state =
  let 
    {subs} = state.mouseMsgs 
  in
    baseSubs
    |>add Mouse.moves subs.move
    |>add Mouse.ups subs.up
    |>add Mouse.downs subs.down
    |>Sub.batch


baseSubs : List (Sub Msg)
baseSubs =
  [ resizes OnWindowResize
  , diffs Tick
  , K.ups (Keyboard Up)
  ]


add : ((Position -> Msg) -> Sub Msg) -> Maybe (Position -> Msg) -> List (Sub Msg) -> List (Sub Msg)
add handler mouse subs =
  
  case mouse of
  
    Nothing ->
  
      subs


    Just ms ->

      (handler ms) :: subs






