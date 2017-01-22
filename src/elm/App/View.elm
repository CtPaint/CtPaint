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
import Canvas        exposing (Canvas, toHtml)
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
mainArea {toolBars, window} =
  let 
    {size} = window 
  in
    div
    [ class "main-work-area" 
    , style 
      [ Style.width (size.width - toolBars.width)
      , Style.height (size.height - toolBars.height)
      , Style.left toolBars.width
      ]
    ]
    []









