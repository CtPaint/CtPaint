module Toolbars.View exposing (..)


import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (onMouseDown, onClick)
import View.Util       as Style
import Model           exposing (ToolBars, State)
import Message         exposing (Msg(..))
import Tools.Tools     as Tools
import Mouse.Types     exposing (MouseDir(..), noPosition)
import ToolBars.Types  exposing (ToolbarMsg(..))
import Window          exposing (Size)
import Tools.Components.Button as Button


vertical : State -> Html Msg
vertical {toolBars, tool} =
  div
  [ class "vertical-tool-bar" 
  , style [ Style.width toolBars.size.width ]
  ]
  (List.map (Button.render tool.name) Tools.all)
  


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





