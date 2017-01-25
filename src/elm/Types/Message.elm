module Types.Message exposing (..)


import Mouse          exposing (Position)
import Window         exposing (Size)
import Init.Types     exposing (SetUpMsg)
import ToolBars.Types exposing (ToolbarMsg)
import Tools.Names    exposing (ToolName)





type Msg 
  = OnWindowResize Size
  | Toolbar ToolbarMsg
  | Tool ToolName 
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






