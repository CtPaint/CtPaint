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



verticalToolBar : ToolBars -> Html Msg
verticalToolBar {width} =
  div
  [ class "vertical-tool-bar" 
  , style [ Style.width width ]
  ]
  []


horitonztalToolBar : Size -> ToolBars -> Html Msg
horitonztalToolBar size {width, height} =
  div
  [ class "horizontal-tool-bar" 
  , style
    [ Style.height height
    , Style.width (size.width - width)
    , Style.left width
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



