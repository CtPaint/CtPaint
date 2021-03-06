module Toolbars.Update exposing (update)


import Toolbars.HorizontalBarResize as OnResize
import Model          exposing (State, Model(..))
import Message        exposing (Msg(..))
import ToolBars.Types exposing (ToolbarMsg(..))
import Tools.Tools    as Tools



update : ToolbarMsg -> State -> (Model, Cmd Msg)
update message state =

  case message of
  
    HorizontalBarResize mouseDir ->
  
      OnResize.update mouseDir state

    
    SetCurrentTool name ->

      App
      { state
      | tool = Tools.get name
      } ! []

