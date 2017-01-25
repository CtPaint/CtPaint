module App.View exposing (view)


import Html             exposing (..)
import Html.Attributes  exposing (style, class)
import Types.Model      exposing (State)
import Types.Message    exposing (Msg(..))
import Canvas           exposing (Canvas)
import View.Util        as Style
import Toolbars.View    as Toolbars
import Mouse.Types      exposing (MouseDir(..))



view : State -> Html Msg
view state =
  div
  [ class "main" ]
  [ Toolbars.vertical state
  , Toolbars.horizontal 
      state.window.size
      state.toolBars 
  , mainArea state
  , screen state
  ]


screen : State -> Html Msg
screen {window, toolBars, currentTool} =
  let 
    toolBars_ = 
      toolBars.size

    window_ =
      window.size
  in
    div
    [ Style.classes [ "screen", toString currentTool.name ] 
    , style 
      [ Style.width 
          (window_.width - toolBars_.width)
      , Style.height 
          (window_.height - toolBars_.height)
      , Style.left toolBars_.width
      ]
    , Canvas.onMouseDown (Tool currentTool.name << Down)
    ] 
    []


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
      [ Style.width 
          (window_.width - toolBars_.width)
      , Style.height 
          (window_.height - toolBars_.height)
      , Style.left toolBars_.width
      ]
    ]
    [ Canvas.toHtml
      [ class "main-canvas"
      , style 
        [ Style.left canvas.position.x
        , Style.top canvas.position.y
        ]
      ]
      canvas.get
    ]









