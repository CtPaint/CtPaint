module Toolbars.View exposing (..)


import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (onMouseDown, onClick)
import View.Util        exposing (classes)
import View.Util        as Style
import Types.Model      exposing (ToolBars, State)
import Types.Message    exposing (Msg(..))
import Tools.Types      exposing (Tool)
import Tools.Names      exposing (ToolName(..))
import Tools.Tools      as Tools
import Mouse.Types      exposing (MouseDir(..), noPosition)
import ToolBars.Types   exposing (ToolbarMsg(..))
import Window           exposing (Size)



vertical : State -> Html Msg
vertical {toolBars, currentTool} =
  div
  [ class "vertical-tool-bar" 
  , style [ Style.width toolBars.size.width ]
  ]
  (List.map (toolButton currentTool.name) Tools.all)
  


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
    , Down noPosition
      |>HorizontalBarResize
      |>Toolbar
      |>onMouseDown
    ]
    []
  ]


toolButton : ToolName -> Tool -> Html Msg
toolButton currentTool {name, icon} =
  let

    selected =
      if currentTool == name then
        "selected"
      else
        ""
  in
    div
    [ classes [ "tool-button", selected ] 
    , onClick (Toolbar <| SetCurrentTool name)
    ]
    [ p 
      [ classes [ "icon", selected ] ]
      [ text icon ]
    ]






