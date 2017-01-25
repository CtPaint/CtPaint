module Mouse.Types exposing (..)


import Mouse exposing (Position)


type MouseDir
  = Down Position
  | Up Position
  | Move Position


noPosition : Position
noPosition = 
  Position 0 0