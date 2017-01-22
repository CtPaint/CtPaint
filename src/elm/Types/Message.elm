module Types.Message exposing (..)


import Mouse  exposing (Position)
import Window exposing (Size)



type Msg 
  = Mouse MouseMsg
  | GetWindowSize (Result Error Size)
  | OnWindowResize Size

type Error 
  = Error


type MouseMsg
  = ToolBar ToolBarMsg
  | WorkArea WorkAreaMsg
  | NoOp 


type ToolBarMsg
  = HorizontalBarResize MouseDir

type WorkAreaMsg
  = Pencil MouseDir



type MouseDir
  = Down
  | Up
  | Move Position



type alias MouseSubs =
  { down : MouseMsg
  , up : MouseMsg
  , move : Position -> MouseMsg
  }



