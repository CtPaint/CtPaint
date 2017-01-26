module Tools.Pencil exposing (update)


import Tools.Names exposing (ToolName(..))
import Mouse.Types exposing (MouseDir(..))
import Model       exposing (State, Model(..), CanvasPack)
import Message     exposing (Msg(..))
import Draw.Types  exposing (DrawMsg(..))
import Mouse       exposing (Position)
import Window      exposing (Size)
import Canvas      exposing (getCanvasSize)
import Color       exposing (Color)

import Debug exposing (log)


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
            }
          }
        } ! []


    Down position ->
      let
        {mouseMsgs, pendingDraws} = state
        {subs, canvas} = mouseMsgs

        p =
          Position
            (position.x - state.canvas.position.x)
            (position.y - state.canvas.position.y)
      in
        App
        { state
        | pendingDraws =
            let
              msg =
                Line p p Color.white
                |> Draw
            in
              msg :: pendingDraws
        , mouseMsgs =
          { mouseMsgs
          | subs =
            { subs
            | move = Tool Pencil << Move 
            }
          , canvas =
            { canvas 
            | move = onMove p Color.white
            }
          }
        } ! []


    Move position ->
      let
        {mouseMsgs, pendingDraws, toolBars} = state
        {subs, canvas} = mouseMsgs

        p =
          Position
            (position.x - state.canvas.position.x - toolBars.size.width)
            (position.y - state.canvas.position.y)
      in
        App
        { state
        | pendingDraws =
            (canvas.move p) :: pendingDraws
        , mouseMsgs =
          { mouseMsgs
          | subs =
            { subs
            | move = Tool Pencil << Move  
            }
          , canvas =
            { canvas 
            | move = onMove p Color.white
            }
          }
        } ! []



onMove : Position -> Color -> Position -> Msg
onMove p0 color p1 =
  Draw <| Line p0 p1 color




