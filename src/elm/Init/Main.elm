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
import Window        exposing (Size)
import Maybe         exposing (withDefault)
import Task



tryInitialization : UninitializedState -> Model
tryInitialization state =
  let 
    ready =
      List.foldr (&&) True  
      [ state.window.size /= Nothing ]
  in
  if ready then
    App 
    { toolBars =
      { width = 29
      , height = 58
      }
    , window =
      { size = 
          state.window.size 
          |>withDefault (Size 800 800)
      }
    , mouseSubs =
      { down = NoOp
      , up   = NoOp
      , move = always NoOp
      }
    }
  else
    Uninitialized state


uninitializedApp : Model
uninitializedApp =
  Uninitialized
  { window =
    { size = Nothing }
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




