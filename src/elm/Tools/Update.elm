module Tools.Update exposing (..)


import Tools.Names exposing (ToolName(..))
import Mouse.Types exposing (MouseDir(..))
import Types.Model exposing (State, Model(..))
import Types.Message exposing (Msg(..))
import Mouse exposing (Position)
import Window exposing (Size)



update : ToolName -> MouseDir -> State -> (Model, Cmd Msg)
update name dir state =

  case name of 

    Hand ->
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

