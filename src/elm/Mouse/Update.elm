module Mouse.Update exposing (update)


import Types.Model   exposing (State, Model(..))
import Types.Message exposing (Msg(..), MouseMsg(..))
import Toolbars.Update as Toolbars



update : MouseMsg -> State -> (Model, Cmd Msg)
update message state =

  case message of 
  
    ToolBar msg ->
  
      Toolbars.update msg state



    WorkArea msg ->

      App state ! []



    NoOp ->

      App state ! []