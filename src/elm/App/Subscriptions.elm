module App.Subscriptions exposing (subscriptions)


import Types.Model   exposing (Model(..), State)
import Types.Message exposing (Msg(OnWindowResize))
import Mouse
import Window        exposing (resizes)



subscriptions : State -> Sub Msg
subscriptions state =
  let {subs} = state.mouseMsgs in
  Sub.batch
  [ Mouse.moves subs.move 
  , Mouse.ups subs.up
  , Mouse.downs subs.down
  , resizes OnWindowResize
  ]