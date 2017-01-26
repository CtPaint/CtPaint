module App.Update exposing (update)


import Model           exposing (Model(..), State)
import Tools.Types     exposing (Tool)
import Tools.Names     exposing (ToolName(..))
import Message         exposing (Msg(..))
import Toolbars.Update as Toolbar
import Init.Main       as Init
import Tools.Update    as Tools
import Draw.Update     as Draw
import Keyboard.Update as Keyboard



update : Msg -> State -> (Model, Cmd Msg)
update message state =
  
  case message of

    Keyboard dir code ->

      Keyboard.update code dir state


    Draw drawMessage ->

      Draw.update drawMessage state


    Tick _ ->
      List.foldr
        onTick
        (App state ! [])
        state.pendingDraws
      |>clearDraws


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


clearDraws : (Model, Cmd Msg) -> (Model, Cmd Msg)
clearDraws (model, cmd) =

  case model of
  
    App state ->
      
      App
      { state
      | pendingDraws = []
      } ! []


    _ ->

      (model, cmd)


onTick : Msg -> (Model, Cmd Msg) -> (Model, Cmd Msg)
onTick msg (model, cmd) =

  case model of
  
    App state ->
  
      update msg state 


    _ ->

      (model, cmd)

      
