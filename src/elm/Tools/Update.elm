module Tools.Update exposing (..)


import Tools.Names exposing (ToolName(..))
import Mouse.Types exposing (MouseDir(..))
import Types.Model exposing (State, Model(..))
import Types.Message exposing (Msg(..))
import Tools.Hand as Hand



update : ToolName -> MouseDir -> State -> (Model, Cmd Msg)
update name dir state =

  case name of 

    Hand ->
      Hand.update dir state


