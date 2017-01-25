module Init.Components.ColorPicker exposing (render)


import Html            exposing (div, p, input, text, Attribute, Html)
import Html.Attributes exposing (class, style, value, type_)
import Html.Events     exposing (onMouseUp)
import Init.Types      exposing (InitColor(..))
import Types.Message   exposing (Msg(..))
import View.Util       exposing (classes)



render : InitColor -> Html Msg
render color =
  let
    colorSelection_ =
      colorSelection color
  in
  div 
  [ class "form-row" ]
  [ div 
    [ class "form-field" ]
    [ p
      [ classes [ "point", "form" ] ]
      [ text "background" ]
    ]
  , div 
    [ class "form-input" ]
    [ colorSelection_ Black
      [ ("background", "#000000") 
      , ("margin-right", "4px")
      ]
    , colorSelection_ White
      [ ("background", "#ffffff") 
      , ("margin-right", "4px")
      ]
    , colorSelection_ Transparent
      [ ("background", "url(\"./transparency-icon.png\")") ]
    ]
  ]


colorSelection : InitColor -> InitColor -> List (String, String) -> Html Msg
colorSelection c0 c1 s =
  input
  [ selectionClass c0 c1
  , setBackground c1
  , type_ "submit"
  , value " "
  , style s
  ] []


setBackground : InitColor -> Attribute Msg
setBackground =
  onMouseUp << SetProjectBackground


selectionClass : InitColor -> InitColor -> Attribute Msg
selectionClass c0 c1 =
  [ "color-selection", "width-64" ]
  |>(::) (colorSelected c0 c1) 
  |>classes


colorSelected : InitColor -> InitColor -> String
colorSelected c0 c1 =
  if c0 == c1 then "selected" else ""





