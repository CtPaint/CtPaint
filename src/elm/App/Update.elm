module App.Update exposing (update)


import Types.Model   exposing (Model(..), State)
import Types.Tools   exposing (ToolName(..), Tool, getTool)
import Types.Message exposing (Msg(..))
import Mouse.Update  as Mouse 
import Init.Main     as Init



update : Msg -> State -> (Model, Cmd Msg)
update message state =
  
  case message of
    
    Mouse mouseMessage ->

      Mouse.update mouseMessage state


    SetCurrentTool toolName ->

      App
      { state
      | currentTool = getTool toolName
      } ! []


    GetWindowSize result ->

      case Result.toMaybe result of

        Nothing ->

          (App state) ! [ Init.getWindowSize ]


        Just size ->

          App 
          { state
          | window =
              let {window} = state in
              { window
              | size = size
              }
          } ! []


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

      
