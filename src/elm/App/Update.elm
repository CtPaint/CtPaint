module App.Update exposing (update)

import Types.Model exposing (Model(..), State)
import Types.Message exposing (Msg(..))
import MouseActivity



update : Msg -> State -> (Model, Cmd Msg)
update message state =
  case message of
    
    Mouse activity ->
      MouseActivity.update activity state

    OnWindowResize size ->
      let {window} = state in
      App { state
      | window = 
        { window | size = size }
      } ! []

    _ -> 
      App state ! []
