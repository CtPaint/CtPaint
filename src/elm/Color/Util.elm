module Color.Util exposing (..)


import Color exposing (Color)
import ParseInt


toHex : Color -> String
toHex color =
  let
    {red, green, blue} = 
      Color.toRgb color
  in
    "#"
    ++ ParseInt.toHex red
    ++ ParseInt.toHex green
    ++ ParseInt.toHex blue

