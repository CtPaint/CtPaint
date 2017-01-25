module Init.Initialize exposing (from)


import Types.Model   exposing 
  ( Model(..)
  , UninitializedState
  , State
  )
import Types.Message exposing (Msg(..))
import Init.Types    exposing (InitColor(..))
import Tools.Names   exposing (ToolName(..))
import Tools.Tools   as Tools 
import Window        exposing (Size)
import Maybe         exposing (withDefault)
import Canvas     
import Mouse exposing (Position)
import Color



from : UninitializedState -> Model    
from state = 
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
  , mouseMsgs =
    { canvas = 
      { down = always NoOp
      , up   = always NoOp
      , move = always NoOp
      }
    , subs =
      { down = always NoOp
      , up   = always NoOp
      , move = always NoOp
      }
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
          Canvas.initialize canvasSize
          |> Canvas.fill color

    , position = 
        Position
          ((windowSize.width - canvasSize.width) // 2)
          ((windowSize.height - canvasSize.height) // 2)

    }

  , tool = Tools.hand
  
  }   