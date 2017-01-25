module Tools.Tools exposing (..)


import Tools.Types exposing (Tool)
import Tools.Names exposing (ToolName(..))
import Message     exposing (Msg(..))


hand : Tool
hand = 
  { name = Hand
  , icon = "\xEA0A"
  }

pencil : Tool
pencil =
  { name = Pencil 
  , icon = "\xEA02"
  }



all : List Tool
all =
  [ hand 
  , pencil
  ]


get : ToolName -> Tool
get name =

  case name of

    Hand -> hand

    Pencil -> pencil




