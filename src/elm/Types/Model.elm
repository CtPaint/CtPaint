module Types.Model exposing (..)


import Mouse         exposing (Position)
import Window        exposing (Size)
import Types.Message exposing (MouseSubs)
import Types.Basic   exposing (InitColor)
import Types.Tools   exposing (ToolName, Tool)
import Canvas        exposing (Canvas)



type Model
  = Uninitialized UninitializedState
  | App State

type alias UninitializedState =
  { window      : { size : Maybe Size }
  , projectName : String
  , canvasSize  : Size
  , ready       : Bool
  , initColor   : InitColor
  }

type alias State =
  { toolBars     : ToolBars 
  , window       : { size : Size }
  , mouseSubs    : MouseSubs
  , projectName  : String
  , canvas       : CanvasPack
  , currentTool  : Tool
  }


type alias CanvasPack =
  { get : Canvas
  , position : Position
  }

type alias ToolBars =
  { size : Size }






  