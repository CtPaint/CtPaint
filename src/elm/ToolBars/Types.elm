module ToolBars.Types exposing (..)


import Mouse.Types exposing (MouseDir)
import Tools.Names exposing (ToolName)


type ToolbarMsg
  = HorizontalBarResize MouseDir
  | SetCurrentTool ToolName