module Toolbars.View exposing (..)


import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (onMouseDown, onClick)
import View.Util        exposing (classes)
import View.Util        as Style
import Types.Model      exposing (ToolBars, State)
import Types.Tools      exposing (ToolName, Tool)
import Window           exposing (Size)
import Types.Message    exposing 
  ( Msg(..)
  , MouseMsg(..)
  , MouseDir(..)
  , ToolBarMsg(..)
  )
import Types.Tools exposing (tools, Tool)
import Dict        exposing (values)



vertical : State -> Html Msg
vertical {toolBars, currentTool} =
  div
  [ class "vertical-tool-bar" 
  , style [ Style.width toolBars.size.width ]
  ]
  (List.map (toolButton currentTool.name) tools)
  


horizontal : Size -> ToolBars -> Html Msg
horizontal window {size} =
  div
  [ class "horizontal-tool-bar" 
  , style
    [ Style.height size.height
    , Style.width (window.width - size.width)
    , Style.left size.width
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


toolButton : ToolName -> Tool -> Html Msg
toolButton currentTool {icon, name} =
  let
  
    selected =
      if currentTool == name then
        "selected"
      else
        ""
  in
    div
    [ classes [ "tool-button", selected ] 
    , onClick (SetCurrentTool name)
    ]
    [ p 
      [ classes [ "icon", selected ] ]
      [ text icon ]
    ]






