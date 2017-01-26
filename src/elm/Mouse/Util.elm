module Mouse.Util exposing (resetMousePacks)


import Model exposing (State)
import Message exposing (MousePack)


resetMousePacks : State -> State
resetMousePacks state =
  { state
  | mouseMsgs = 
    { canvas = blankPack
    , subs = blankPack
    }
  }

blankPack : MousePack
blankPack = 
  { down = Nothing
  , up = Nothing
  , move = Nothing
  }