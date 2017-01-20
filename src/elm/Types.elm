module Types exposing (..)

import Mouse exposing (Position)

type Msg 
  = Mouse MouseActivity

type MouseDirection
  = Down 
  | Up
  | Move Position

type MouseActivity
  = ToolBar ToolBarMsg
  | NoOp

type ToolBarMsg
  = HorizontalBarResize MouseDirection

type alias Model =
  { toolBars : ToolBars 
  , globalMouseMsgs : 
    { down : MouseActivity
    , up : MouseActivity
    , move : Position -> MouseActivity
    }
  }

type alias ToolBars =
  { width : Int
  , height : Int
  }