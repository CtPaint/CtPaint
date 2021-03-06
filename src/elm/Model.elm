module Model exposing (..)


import Mouse       exposing (Position)
import Window      exposing (Size)
import Message     exposing (Msg(..), MousePack)
import Init.Types  exposing (InitColor)
import Tools.Types exposing (Tool)
import Tools.Names exposing (ToolName)
import Canvas      exposing (Canvas)
import Draw.Types  exposing (DrawMsg(..))
import Color       exposing (Color)
import Color.Types exposing (PrimaryPalette)


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
  , projectName  : String
  , canvas       : CanvasPack
  , tool         : Tool
  , mouseMsgs    :
    { canvas : MousePack
    , subs : MousePack
    }
  , pendingDraws : List Msg
  , palette :
    { primary : PrimaryPalette
    , general : List Color
    }
  }


type alias CanvasPack =
  { get : Canvas
  , position : Position
  }

type alias ToolBars =
  { size : Size }






  