module Message exposing (..)


import Mouse          exposing (Position)
import Window         exposing (Size)
import Init.Types     exposing (SetUpMsg)
import ToolBars.Types exposing (ToolbarMsg)
import Tools.Names    exposing (ToolName)
import Draw.Types     exposing (DrawMsg)
import Mouse.Types    exposing (MouseDir)
import Time           exposing (Time)




type Msg 
  = OnWindowResize Size
  | Toolbar ToolbarMsg
  | Tool ToolName MouseDir
  | SetUp SetUpMsg
  | Draw DrawMsg
  | Tick Time
  | GetWindowSize (Result Error Size)
  | NoOp


type Error 
  = Error


type alias MousePack =
  { down : Maybe (Position -> Msg) 
  , up : Maybe (Position -> Msg)
  , move : Maybe (Position -> Msg)
  }









