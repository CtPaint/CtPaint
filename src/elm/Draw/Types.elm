module Draw.Types exposing (..)


import Mouse exposing (Position)
import Color exposing (Color)



type DrawMsg 
  = Line Position Position Color

  