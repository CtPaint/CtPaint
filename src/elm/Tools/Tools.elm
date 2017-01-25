module Tools.Tools exposing (..)


import Tools.Types exposing (Tool)
import Tools.Names exposing (ToolName(..))
import Types.Message exposing (Msg(..))


move : Tool
move = 
  { name = Move
  , icon = "\xEA0A"
  , mouseMsgs =
    { canvas =
      { up = always NoOp 
      , down = always NoOp
      , move = always NoOp
      }
    , subs =
      { up = always NoOp 
      , down = always NoOp
      , move = always NoOp
      }
    }
  }


all : List Tool
all =
  [ move ]

get : ToolName -> Tool
get name =
  case name of

    Move -> move