module Toolbars.HorizontalBarResize exposing (update)


import Types.Model exposing (State, Model(..))
import Types.Message exposing 
  ( Msg(..)
  , ToolBarMsg(..)
  , MouseDir(..)
  , MouseMsg(..)
  )



update : MouseDir -> State -> (Model, Cmd Msg)
update direction state =
  
  case direction of

    Down ->
      let 
        { mouseSubs } = state 

        moveMsg =
          Move >> HorizontalBarResize >> ToolBar
      in
        App 
        { state
        | mouseSubs =
          { mouseSubs
          | move = moveMsg
          , up = ToolBar (HorizontalBarResize Up)
          }
        } ! []


    Up ->
      let 
        { mouseSubs } = state 
      in
        App 
        { state
        | mouseSubs =
          { mouseSubs
          | move = always NoOp
          , up = NoOp
          }
        } ! []


    Move position ->
      let 
        { toolBars, window } = state 
      in
        App 
        { state
        | toolBars =
          { toolBars
          | height = 
              let { height } = window.size in
              height - position.y
          }
        } ! []