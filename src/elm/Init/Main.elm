module Init.Main exposing (..)


import Types.Model   exposing 
  ( Model(..)
  , UninitializedState
  , State
  )
import Types.Message exposing 
  ( Msg(..)
  , MouseMsg(..)
  )
import Types.Basic   exposing (InitColor(..))
import Window        exposing (Size)
import Maybe         exposing (withDefault)
import Task
import Canvas        exposing (Position)



uninitializedApp : Model
uninitializedApp =
  Uninitialized
  { window = 
    { size = Nothing } 
  , projectName = ""
  , canvasSize = 
    { width = "100"
    , height = "100"
    }
  , ready = False
  , initColor = White
  }


initCmd : Cmd Msg
initCmd =
  Cmd.batch
  [ getWindowSize ]


getWindowSize : Cmd Msg
getWindowSize = 
  Task.attempt 
    GetWindowSize 
    Window.size




