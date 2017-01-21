module Types.Message exposing (..)

import Mouse  exposing (Position)
import Window exposing (Size)


type Msg 
  = Mouse MouseActivity
  | GetWindowSize (Result Error Size)
  | OnWindowResize Size

type Error 
  = Error

type MouseDirection
  = Down
  | Up
  | Move Position

type MouseActivity
  = ToolBar ToolBarMsg
  | WorkArea WorkAreaMsg
  | NoOp 

type ToolBarMsg
  = HorizontalBarResize MouseDirection

type WorkAreaMsg
  = Pencil MouseDirection

type alias MouseSubs =
  { down : MouseActivity
  , up : MouseActivity
  , move : Position -> MouseActivity
  }