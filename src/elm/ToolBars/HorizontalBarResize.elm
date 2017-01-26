module Toolbars.HorizontalBarResize exposing (update)


import Window         exposing (Size)
import Model          exposing (State, Model(..))
import Message        exposing (Msg(..))
import ToolBars.Types exposing (ToolbarMsg(..))
import Mouse.Types    exposing (MouseDir(..), noPosition)
import Mouse.Util     exposing (resetMousePacks)




update : MouseDir -> State -> (Model, Cmd Msg)
update direction state =
  
  case direction of

    Up _ ->

      App (resetMousePacks state) ! []


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
            | move = Just (Move >> mouseMsg)
            , up = Just (Up >> mouseMsg)
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





        