module App.Subscriptions exposing (subscriptions)


import Model   exposing (Model(..), State)
import Message exposing (Msg(OnWindowResize))
import Mouse
import Window  exposing (resizes)



subscriptions : State -> Sub Msg
subscriptions state =
  let 
    {subs} = state.mouseMsgs 
  in
    Sub.batch
    [ Mouse.moves subs.move 
    , Mouse.ups subs.up
    , Mouse.downs subs.down
    , resizes OnWindowResize
    ]