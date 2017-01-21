module App.Update exposing (update)


import Types.Model exposing (Model(..), State)
import Types.Message exposing (Msg(..))
import Mouse.Update as Mouse 



update : Msg -> State -> (Model, Cmd Msg)
update message state =
  
  case message of
    
    Mouse mouseMessage ->

      Mouse.update mouseMessage state


    OnWindowResize size ->
      let 
        {window} = state 
      in
        App 
        { state
        | window = 
          { window | size = size }
        } ! []


    _ -> 

      App state ! []
