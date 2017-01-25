module Tools.Types exposing (Tool)


import Mouse exposing (Position)
import Types.Message exposing (Msg(..), MousePack)
import Tools.Names exposing (ToolName)


type alias Tool =
  { name : ToolName
  , icon : String
  , mouseMsgs :
    { canvas : MousePack
    , subs : MousePack
    }
  }