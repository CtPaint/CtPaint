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
import Color

initialize : UninitializedState -> Model    
initialize state = 
  let
    {projectName, canvasSize, initColor} =
      state

    windowSize =
      state.window.size
      |>withDefault (Size 800 800)
  in  
  App     
  { toolBars = 
    { size = Size 29 58 }   
  , window =    
    { size = windowSize }   
  , mouseSubs =   
    { down = NoOp   
    , up   = NoOp   
    , move = always NoOp    
    } 
  , projectName = projectName

  , canvas =
    { get = 
        let
          color =
            case initColor of

              Black -> 
                Color.black
              White ->
                Color.white
              Transparent ->
                Color.rgba 0 0 0 0

        in
          Canvas.initialize 
            canvasSize.width 
            canvasSize.height
          |>Canvas.fill color

    , position = 
        Position
          ((windowSize.width - canvasSize.width) // 2)
          ((windowSize.height - canvasSize.height) // 2)
    }  
  }   


uninitializedApp : Model
uninitializedApp =
  Uninitialized
  { window = 
    { size = Nothing } 
  , projectName = ""
  , canvasSize = Size 200 200
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


initDev : Model
initDev =
  initialize
  { window = { size = Nothing } 
  , projectName = "dev"
  , canvasSize = Size 200 200
  , ready = True
  , initColor = White
  }



