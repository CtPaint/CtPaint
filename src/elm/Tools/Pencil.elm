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
import Mouse.Util  exposing (resetMousePacks)



update : MouseDir -> State -> (Model, Cmd Msg)
update dir state =

  case dir of

    Up position ->

      App (resetMousePacks state) ! []



    Down position ->
      let
        {mouseMsgs, pendingDraws} = state

        {subs, canvas} = mouseMsgs

        color = state.palette.primary.tl

        p =
          Position
            (position.x - state.canvas.position.x)
            (position.y - state.canvas.position.y)
      in
        App
        { state
        | pendingDraws =
            (Draw <| Line p p color) :: pendingDraws
        , mouseMsgs =
          { mouseMsgs
          | subs =
            { subs
            | move = Just (Tool Pencil << Move)
            }
          , canvas =
            { canvas 
            | move = Just (onMove p color)
            }
          }
        } ! []


    Move position ->
      let
        {mouseMsgs, pendingDraws, toolBars} = state

        {subs, canvas} = mouseMsgs

        color = state.palette.primary.tl

        p =
          Position
            (position.x - state.canvas.position.x - toolBars.size.width)
            (position.y - state.canvas.position.y)
      in
        App
        { state
        | pendingDraws =
            case canvas.move of
              Nothing ->
                pendingDraws
              Just move ->
                (move p) :: pendingDraws
        , mouseMsgs =
          { mouseMsgs
          | subs =
            { subs
            | move = Just (Tool Pencil << Move ) 
            }
          , canvas =
            { canvas 
            | move = Just (onMove p color)
            }
          }
        } ! []



onMove : Position -> Color -> Position -> Msg
onMove p0 color p1 =
  Draw <| Line p0 p1 color




