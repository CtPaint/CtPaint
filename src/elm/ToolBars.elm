module ToolBars exposing (update)

import Types.Model exposing (State, Model(..))
import Types.Message exposing 
  ( Msg(..)
  , ToolBarMsg(..)
  , MouseDirection(..)
  , MouseActivity(..)
  )

update : ToolBarMsg -> State -> (Model, Cmd Msg)
update message state =
  case message of
    HorizontalBarResize mouseDirection ->
      case mouseDirection of
        Down ->
          let { mouseSubs } = state in
          App 
          { state
          | mouseSubs =
            { mouseSubs
            | move =
                Move
                >>HorizontalBarResize
                >>ToolBar
            , up =
                ToolBar (HorizontalBarResize Up)
            }
          } ! []

        Move position ->
          let { toolBars, window } = state in
          App 
          { state
          | toolBars =
            { toolBars
            | height = 
                let { height } = window.size in
                height - position.y
            }
          } ! []

        Up ->
          let { mouseSubs } = state in
          App 
          { state
          | mouseSubs =
            { mouseSubs
            | move = always NoOp
            , up = NoOp
            }
          } ! []
