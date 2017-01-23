module Toolbars.HorizontalBarResize exposing (update)


import Window        exposing (Size)
import Types.Model   exposing (State, Model(..))
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
        window =
          state.window.size

        {toolBars} = state
      in
        App 
        { state
        | toolBars =
          { toolBars
          | size = 
              Size 
                toolBars.size.width 
                (window.height - position.y)
          }
        } ! []





        