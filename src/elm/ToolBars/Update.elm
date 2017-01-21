module Toolbars.Update exposing (update)


import Toolbars.HorizontalBarResize as OnResize
import Types.Model exposing (State, Model(..))
import Types.Message exposing 
  ( Msg(..)
  , ToolBarMsg(..)
  , MouseDir(..)
  , MouseMsg(..)
  )



update : ToolBarMsg -> State -> (Model, Cmd Msg)
update message state =

  case message of
  
    HorizontalBarResize mouseDir ->
  
      OnResize.update mouseDir state

