module App.Subscriptions exposing (subscriptions)


import Types.Model   exposing (Model(..), State)
import Types.Message exposing (Msg(OnWindowResize, Mouse))
import Mouse         exposing (moves, ups, downs)
import Window        exposing (resizes)



subscriptions : State -> Sub Msg
subscriptions {mouseSubs} =
  Sub.batch
  [ mouseSubs.move 
    >> Mouse |> moves
  
  , always mouseSubs.up 
    >> Mouse |> ups
  
  , always mouseSubs.down 
    >> Mouse |> downs

  , resizes OnWindowResize
  ]