module Draw.Update exposing (update)


import Draw.Types exposing (..)
import Model      exposing (State, Model(..))
import Message    exposing (Msg(..))
import Canvas


update : DrawMsg -> State -> (Model, Cmd Msg)
update message state =

  case message of

    Line p0 p1 color ->
      let
        {canvas} = state
      in
        App
        { state 
        | canvas =
          { canvas
          | get =
              Canvas.drawLine p0 p1 color canvas.get
          }
        } ! []



