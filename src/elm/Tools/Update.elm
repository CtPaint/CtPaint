module Tools.Update exposing (..)


import Tools.Names exposing (ToolName(..))
import Mouse.Types exposing (MouseDir(..))
import Model       exposing (State, Model(..))
import Message     exposing (Msg(..))
import Tools.Hand  as Hand
import Tools.Pencil as Pencil



update : ToolName -> MouseDir -> State -> (Model, Cmd Msg)
update name dir state =

  case name of 

    Hand ->

      Hand.update dir state


    Pencil ->

      Pencil.update dir state


