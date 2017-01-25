module Tools.Tools exposing (..)


import Tools.Types exposing (Tool)
import Tools.Names exposing (ToolName(..))
import Message     exposing (Msg(..))


hand : Tool
hand = 
  { name = Hand
  , icon = "\xEA0A"
  }




all : List Tool
all =
  [ hand ]


get : ToolName -> Tool
get name =

  case name of

    Hand -> hand




