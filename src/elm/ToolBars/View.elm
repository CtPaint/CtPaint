module Toolbars.View exposing (..)


import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (onMouseDown)
import View.Util        as Style
import Types.Model      exposing (ToolBars)
import Window           exposing (Size)
import Types.Message    exposing 
  ( Msg (..)
  , MouseMsg(..)
  , MouseDir(..)
  , ToolBarMsg(..)
  )



vertical : ToolBars -> Html Msg
vertical {size} =
  div
  [ class "vertical-tool-bar" 
  , style [ Style.width size.width ]
  ]
  []


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



