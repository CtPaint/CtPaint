module Tools.Hand exposing (update)


import Tools.Names exposing (ToolName(..))
import Mouse.Types exposing (MouseDir(..))
import Model       exposing (State, Model(..), CanvasPack)
import Message     exposing (Msg(..))
import Mouse       exposing (Position)
import Window      exposing (Size)
import Canvas      exposing (getCanvasSize)
import Tools.Util  exposing (withinCanvas)
import Mouse.Util  exposing (resetMousePacks)


update : MouseDir -> State -> (Model, Cmd Msg)
update dir state =

  case dir of

    Up position ->

      App (resetMousePacks state) ! []


    Down position ->
      if withinCanvas state.canvas position then
        let

          p =
            Position
              (position.x - state.canvas.position.x)
              (position.y - state.canvas.position.y)

          {mouseMsgs, toolBars} = state
          {subs} = mouseMsgs

        in

          App
          { state
          | mouseMsgs = 
            { mouseMsgs 
            | subs =
              { subs
              | move = Just (onMove toolBars.size p)
              , up   = Just (Up >> Tool Hand)
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



onMove : Size -> Position -> Position -> Msg
onMove {width, height} p0 p1 =
  let
    position =
      Position 
        (p1.x - p0.x - width)
        (p1.y - p0.y)

  in
    Tool Hand (Move position)


