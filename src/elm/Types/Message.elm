module Types.Message exposing (..)


import Mouse          exposing (Position)
import Window         exposing (Size)
import Init.Types     exposing (InitColor)
import ToolBars.Types exposing (ToolbarMsg)
import Types.Tools    exposing (ToolName(..))




type Msg 
  = OnWindowResize Size
  | Toolbar ToolbarMsg


  | GetWindowSize (Result Error Size)
  | CheckIfReady
  | SetProjectName String
  | SetProjectWidth String
  | SetProjectHeight String
  | SetProjectBackground InitColor
  | SetCurrentTool ToolName
  | StartApp

  | NoOp


type Error 
  = Error


type alias MousePack =
  { down : Position -> Msg 
  , up : Position -> Msg
  , move : Position -> Msg
  }






