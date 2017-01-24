module Init.View exposing (view)


import Html            exposing (..)
import Html.Attributes exposing (class, style, value, type_, placeholder)
import Html.Events     exposing (onMouseUp)
import Types.Model     exposing (UninitializedState)
import Types.Basic     exposing (InitColor(..))
import Types.Message   exposing (Msg(..))
import View.Util       exposing (classes)
import Init.Components.ColorPicker as ColorPicker
import Init.Components.Fields as Fields



view : UninitializedState -> Html Msg
view {projectName, canvasSize, initColor, ready} =
  div 
  [ class "main" ]
  [ div 
    [ classes [ "window-card", "init" ] ]
    [ title
    , Fields.name   projectName
    , Fields.width  canvasSize.width
    , Fields.height canvasSize.height
    , ColorPicker.render initColor
    , okayButton ready
    ] 
  ]


okayButton : Bool -> Html Msg
okayButton ready =
  let 
    class_ =
      class <|
      if ready then 
        "button"
      else 
        "button null"
  in
    div 
    [ class "form-submit-container" ]
    [ input 
      [ class_
      , value "Okay"
      , type_ "submit"
      , onMouseUp StartApp
      ]
      []
    ]


title : Html Msg
title =
  let
    class_ =
      classes
      [ "point"
      , "really-big"
      , "centered-text"
      , "vector" 
      ]
  
    style_ =
      style 
      [ ("margin-top", "70px") ]
  in
    p 
    [ class_, style_ ] 
    [ text "CtPaint" ]




    