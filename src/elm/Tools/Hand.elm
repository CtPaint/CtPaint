module Tools.Hand exposing (update)


import Tools.Names   exposing (ToolName(..))
import Mouse.Types   exposing (MouseDir(..))
import Types.Model   exposing (State, Model(..), CanvasPack)
import Types.Message exposing (Msg(..))
import Mouse         exposing (Position)
import Window        exposing (Size)
import Canvas        exposing (getCanvasSize)



update : MouseDir -> State -> (Model, Cmd Msg)
update dir state =

  case dir of

    Up position ->
      let
        {mouseMsgs} = state
        {subs} = mouseMsgs
      in
        App
        { state
        | mouseMsgs = 
          { mouseMsgs 
          | subs =
            { subs
            | move = always NoOp
            , up = always NoOp
            }
          }
        } ! []


    Down position ->
      if withinCanvas state.canvas position then
        let
          x = position.x - state.canvas.position.x
          y = position.y - state.canvas.position.y

          {mouseMsgs} = state
          {subs} = mouseMsgs
        in
          App
          { state
          | mouseMsgs = 
            { mouseMsgs 
            | subs =
              { subs
              | move = onMove state.toolBars.size (Position x y)
              , up = Up >> Tool Hand
              }
            }
          } ! []
      else
        App state ! []


    Move position ->
      let
        {canvas} = state
      in
        App 
        { state
        | canvas =
          { canvas
          | position = position
          }
        } ! []




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


onMove : Size -> Position -> Position -> Msg
onMove {width, height} p0 p1 =
  let
    position =
      Position 
        (p1.x - p0.x - width)
        (p1.y - p0.y)

  in
    Tool Hand (Move position)


