module Init.Initialize exposing (from)


import Model       exposing (Model(..), UninitializedState, State)
import Message     exposing (Msg(..))
import Init.Types  exposing (InitColor(..))
import Tools.Names exposing (ToolName(..))
import Tools.Tools as Tools 
import Window      exposing (Size)
import Maybe       exposing (withDefault)
import Mouse       exposing (Position)
import Color.Palette as Palette
import Canvas     
import Color



from : UninitializedState -> Model    
from state = 
  let
    {projectName, canvasSize, initColor} =
      state

    windowSize =
      state.window.size
      |>Maybe.withDefault (Size 800 800)
  in  
  App
  { toolBars = 
    { size = Size 29 58 }   
  , window =    
    { size = windowSize }   
  , mouseMsgs =
    { canvas = 
      { down = Nothing
      , up   = Nothing
      , move = Nothing
      }
    , subs =
      { down = Nothing
      , up   = Nothing
      , move = Nothing
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

  , tool = Tools.pencil

  , pendingDraws = []

  , palette = 
    { primary =
      { tl = Color.rgb 241 29 35
      , tr = Color.rgb 23 92 254
      , bl = Color.rgb 176 166 153
      , br = Color.white
      }

    , general = Palette.init
    
    }
  
  }   