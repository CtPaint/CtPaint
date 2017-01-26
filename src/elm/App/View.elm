module App.View exposing (view)


import Html            exposing (..)
import Html.Attributes exposing (style, class)
import Model           exposing (State)
import Message         exposing (Msg(..))
import Canvas          exposing (Canvas)
import View.Util       as Style
import Toolbars.View   as Toolbars
import Mouse.Types     exposing (MouseDir(..))



view : State -> Html Msg
view state =
  div
  [ class "main" ]
  [ Toolbars.vertical state
  , Toolbars.horizontal state
  , mainArea state
  , screen state
  ]


screen : State -> Html Msg
screen {window, toolBars, tool} =
  div
  [ Style.classes [ "screen", toString tool.name ] 
  , style 
    [ window.size.width - toolBars.size.width
      |> Style.width
    , window.size.height - toolBars.size.height
      |> Style.height 
    , Style.left toolBars.size.width
    ]
  , Canvas.onMouseDown (Tool tool.name << Down)
  , Canvas.onMouseUp (Tool tool.name << Up)
  ] 
  []


mainArea : State -> Html Msg
mainArea {window, toolBars, canvas} =
  div
  [ class "main-work-area" 
  , style 
    [ window.size.width - toolBars.size.width
      |> Style.width
    , window.size.height - toolBars.size.height
      |> Style.height 
    , Style.left toolBars.size.width
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









