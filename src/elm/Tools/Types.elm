module Tools.Types exposing (Tool)


import Mouse       exposing (Position)
import Message     exposing (Msg(..), MousePack)
import Tools.Names exposing (ToolName)


type alias Tool =
  { name : ToolName
  , icon : String
  }