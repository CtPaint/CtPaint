module App.Subscriptions exposing (subscriptions)

import Types.Model exposing (Model(..), State)
import Types.Message exposing (Msg(..))

import Mouse
import Window 



subscriptions : State -> Sub Msg
subscriptions {mouseSubs} =
  Sub.batch
  [ mouseSubs.move 
    >> Msg.Mouse 
    |> Mouse.moves
  
  , always mouseSubs.up 
    >> Msg.Mouse 
    |> Mouse.ups
  
  , always mouseSubs.down 
    >> Msg.Mouse 
    |> Mouse.downs

  , Window.resizes OnWindowResize
  ]