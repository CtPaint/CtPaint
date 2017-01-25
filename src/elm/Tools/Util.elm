module Tools.Util exposing (..)


import Model  exposing (CanvasPack)
import Mouse  exposing (Position)
import Canvas exposing (getCanvasSize)




withinCanvas : CanvasPack -> Position -> Bool
withinCanvas {get, position} {x, y} =
  let

    {width, height} = getCanvasSize get

    withinX = 
      (position.x < x) && (x < (position.x + width))

    withinY =
      (position.y < y) && (y < (position.y + height))

  in
    withinY && withinX
