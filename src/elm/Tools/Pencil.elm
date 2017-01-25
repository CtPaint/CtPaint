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
      let
        {mouseMsgs, pendingDraws, canvas} = state
        {subs} = mouseMsgs

        p =
          Position
            (position.x - canvas.position.x)
            (position.y - canvas.position.y)
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
            | move = onMove p Color.white 
            }
          }
        } ! []


    Move position ->
      let
        {mouseMsgs, pendingDraws, canvas} = state
        {subs} = mouseMsgs

        p =
          Position
            (position.x - canvas.position.x)
            (position.y - canvas.position.y)
      in
        App
        { state
        | pendingDraws =
            (subs.move p) :: pendingDraws
        , mouseMsgs =
          { mouseMsgs
          | subs =
            { subs
            | move = onMove p Color.white 
            }
          }
        } ! []



onMove : Position -> Color -> Position -> Msg
onMove p0 color p1 =
  Draw <| Line p0 p1 color




