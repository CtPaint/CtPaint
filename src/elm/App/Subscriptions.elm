module App.Subscriptions exposing (subscriptions)


import Model   exposing (Model(..), State)
import Message exposing (Msg(OnWindowResize, Tick))
import Mouse   exposing (moves, ups, downs, Position)
import Window  exposing (resizes)
import AnimationFrame exposing (diffs)



subscriptions : State -> Sub Msg
subscriptions state =
  let 
    {subs} = state.mouseMsgs 
  in
    baseSubs
    |>add moves subs.move
    |>add ups subs.up
    |>add downs subs.down
    |>Sub.batch


baseSubs : List (Sub Msg)
baseSubs =
  [ resizes OnWindowResize
  , diffs Tick
  ]


add : ((Position -> Msg) -> Sub Msg) -> Maybe (Position -> Msg) -> List (Sub Msg) -> List (Sub Msg)
add handler mouse subs =
  
  case mouse of
  
    Nothing ->
  
      subs


    Just ms ->

      (handler ms) :: subs






