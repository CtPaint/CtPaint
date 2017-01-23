module App.View exposing (view)


import Html             exposing (..)
import Html.Attributes  exposing (style, class)
import Types.Model      exposing (State)
import Types.Message    exposing 
  ( Msg (..)
  , MouseMsg(..)
  , MouseDir(..)
  , ToolBarMsg(..)
  )
import Canvas        exposing (Canvas)
import Toolbars.View exposing (verticalToolBar, horitonztalToolBar)
import View.Util     as Style


view : State -> Html Msg
view state =
  div
  [ class "main" ]
  [ verticalToolBar 
      state.toolBars 
  , horitonztalToolBar 
      state.window.size
      state.toolBars 
  , mainArea state
  ]


mainArea : State -> Html Msg
mainArea {window, toolBars, canvas} =
  let 
    toolBars_ = 
      toolBars.size

    window_ =
      window.size
  in
    div
    [ class "main-work-area" 
    , style 
      [ Style.width (window_.width - toolBars_.width)
      , Style.height (window_.height - toolBars_.height)
      , Style.left toolBars_.width
      ]
    ]
    [ Canvas.toHtml
        [ class "main-canvas"
        , style 
          [ ("left", toString canvas.position.x)
          , ("top", toString canvas.position.y)
          ]
        ]
        canvas.get


    ]









