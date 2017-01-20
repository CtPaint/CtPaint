module View exposing (view)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (on, onInput, keyCode, onMouseDown)
import Types            exposing (..)
import Json.Decode as Json
import Canvas exposing (Canvas, toHtml)


-- VIEW


view : Model -> Html Msg
view model = 
  div
  [ class "main" ]
  [ verticalToolBar model.toolBars 
  , horitonztalToolBar model.toolBars 
  , mainArea model
  ]

mainArea : Model -> Html Msg
mainArea {toolBars} =
  let {width} = toolBars in
  div
  [ class "main-work-area" 
  , style
    [ ("left", toString width) ]
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







