module App.Subscriptions exposing (subscriptions)


import Types.Model exposing (Model(..), State)
import Types.Message exposing (Msg(OnWindowResize, Mouse))

import Mouse
import Window 



subscriptions : State -> Sub Msg
subscriptions {mouseSubs} =
  Sub.batch
  [ mouseSubs.move 
    >> Mouse 
    |> Mouse.moves
  
  , always mouseSubs.up 
    >> Mouse 
    |> Mouse.ups
  
  , always mouseSubs.down 
    >> Mouse 
    |> Mouse.downs

  , Window.resizes OnWindowResize
  ]