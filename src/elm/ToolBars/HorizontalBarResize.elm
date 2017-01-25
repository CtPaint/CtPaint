module Toolbars.HorizontalBarResize exposing (update)


import Window        exposing (Size)
import Types.Model   exposing (State, Model(..))
import Types.Message exposing (Msg(..))
import ToolBars.Types exposing (ToolbarMsg(..))
import Mouse.Types   exposing (MouseDir(..), noPosition)



update : MouseDir -> State -> (Model, Cmd Msg)
update direction state =
  
  case direction of

    Down _ ->
      let 
        { mouseMsgs } = state 
        { subs } = mouseMsgs

        mouseMsg =
          HorizontalBarResize >> Toolbar
      in
        App 
        { state
        | mouseMsgs =
          { mouseMsgs
          | subs =
            { subs
            | move = 
                Move >> mouseMsg
            , up = 
                Up >> mouseMsg
            }
          }
        } ! []


    Up _ ->
      let 
        { mouseMsgs } = state 
        { subs } = mouseMsgs
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





        