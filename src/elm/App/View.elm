module App.View exposing (view)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (on, onInput, keyCode, onMouseDown)
import Types.Model      exposing (State, ToolBars)
import Types.Message    exposing 
  ( Msg (..)
  , MouseMsg(..)
  , MouseDir(..)
  , ToolBarMsg(..)
  )
import Json.Decode as Json
import Canvas exposing (Canvas, toHtml)


view : State -> Html Msg
view state =
  div
  [ class "main" ]
  [ verticalToolBar state.toolBars 
  , horitonztalToolBar state.toolBars 
  , mainArea state
  ]

mainArea : State -> Html Msg
mainArea {toolBars, window} =
  let 
    left =
      toolBars.width
      |> toString |> (,) "left"

    height =
      window.size.height - toolBars.height
      |> toString |> (,) "height"

    width =
      window.size.width - toolBars.width
      |> toString |> (,) "width"
  in
    div
    [ class "main-work-area" 
    , style
      [ left, height, width ]
    ]
    []


verticalToolBar : ToolBars -> Html Msg
verticalToolBar {width} =
  div
  [ class "vertical-tool-bar" 
  , style
    [ ("width", toString width) ]
  ]
  []


horitonztalToolBar : ToolBars -> Html Msg
horitonztalToolBar {width, height} =
  div
  [ class "horizontal-tool-bar" 
  , style
    [ ("height", toString height) 
    , ("left", toString width)
    ]
  ]
  [ div
    [ class "horizontal-tool-bar-edge" 
    , HorizontalBarResize Down
      |>ToolBar
      |>Mouse
      |>onMouseDown
    ]
    []
  ]







