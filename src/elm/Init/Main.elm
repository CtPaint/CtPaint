module Init.Main exposing (..)


import Model      exposing (Model(..), UninitializedState)
import Message    exposing (Msg(..))
import Init.Types exposing (InitColor(..))
import Window     exposing (Size)
import Task
import Init.Initialize as Initialize



uninitializedApp : Model
uninitializedApp =
  Uninitialized
  { window      = { size = Nothing } 
  , projectName = ""
  , canvasSize  = Size 200 200
  , ready = False
  , initColor = White
  }


initCmd : Cmd Msg
initCmd =
  Cmd.batch [ getWindowSize ]


getWindowSize : Cmd Msg
getWindowSize = 
  Task.attempt GetWindowSize Window.size


initDev : Model
initDev =
  Initialize.from
  { window = { size = Nothing } 
  , projectName = "dev"
  , canvasSize = Size 600 600
  , ready = True
  , initColor = Black
  }



