module App.Update exposing (update)


import Types.Model   exposing (Model(..), State)
import Tools.Types   exposing (Tool)
import Tools.Names   exposing (ToolName(..))
import Types.Message exposing (Msg(..))
import Toolbars.Update as Toolbar
import Init.Main     as Init
import Tools.Update as Tools



update : Msg -> State -> (Model, Cmd Msg)
update message state =
  
  case message of

    Tool name dir ->
      Tools.update name dir state

    Toolbar msg ->
      Toolbar.update msg state


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

      
