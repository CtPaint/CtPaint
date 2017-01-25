module Tools.Tools exposing (..)


import Tools.Types exposing (Tool)
import Tools.Names exposing (ToolName(..))
import Types.Message exposing (Msg(..))


hand : Tool
hand = 
  { name = Hand
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
  [ hand ]


get : ToolName -> Tool
get name =

  case name of

    Hand -> hand




