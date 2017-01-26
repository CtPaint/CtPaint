module Tools.Components.Button exposing (render)


import Html            exposing (Html, div, p, text)
import Message         exposing (Msg(..))
import Html.Attributes exposing (..)
import Html.Events     exposing (onClick)
import Tools.Names     exposing (ToolName(..))
import Tools.Types     exposing (Tool)
import View.Util       exposing (classes)
import ToolBars.Types  exposing (ToolbarMsg(..))



render : ToolName -> Tool -> Html Msg
render currentTool {name, icon} =
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

