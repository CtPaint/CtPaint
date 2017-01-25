module Message exposing (..)


import Mouse          exposing (Position)
import Window         exposing (Size)
import Init.Types     exposing (SetUpMsg)
import ToolBars.Types exposing (ToolbarMsg)
import Tools.Names    exposing (ToolName)
import Mouse.Types    exposing (MouseDir(..))





type Msg 
  = OnWindowResize Size
  | Toolbar ToolbarMsg
  | Tool ToolName MouseDir
  | SetUp SetUpMsg
  | GetWindowSize (Result Error Size)
  | NoOp


type Error 
  = Error


type alias MousePack =
  { down : Position -> Msg 
  , up : Position -> Msg
  , move : Position -> Msg
  }






