module Types.Model exposing (..)


import Mouse         exposing (Position)
import Window        exposing (Size)
import Types.Message exposing (MouseSubs)


type Model
  = Uninitialized UninitializedState
  | App State

type alias UninitializedState =
  { window :
    { size : Maybe Size }
  }

type alias State =
  { toolBars : ToolBars 
  , window : 
    { size : Size }
  , mouseSubs : MouseSubs
  }

type alias ToolBars =
  { width : Int
  , height : Int
  }