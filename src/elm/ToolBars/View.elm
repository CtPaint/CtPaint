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
import Color.View      as Color


vertical : State -> Html Msg
vertical {toolBars, tool} =
  div
  [ class "vertical-tool-bar" 
  , style [ Style.width toolBars.size.width ]
  ]
  (List.map (Button.render tool.name) Tools.all)
  


horizontal : State -> Html Msg
horizontal state =
  let
    toolBars  = state.toolBars.size
    window    = state.window.size
    {palette} = state
  in
    div
    [ class "horizontal-tool-bar" 
    , style
      [ Style.height toolBars.height
      , Style.width (window.width - toolBars.width)
      , Style.left toolBars.width
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
    , Color.view 
        palette.primary
        palette.general 
    ]





