module Init.View exposing (view)


import Html            exposing (..)
import Html.Attributes exposing (class, style)
import Types.Model     exposing (UninitializedState)
import Types.Message   exposing (Msg(..))
import View.Util       exposing (classes)



view : UninitializedState -> Html Msg
view state =
  div 
  [ class "main" ]
  [ div 
    [ classes [ "window-card", "init" ] ]
    [ div 
      [ class "init-body" ] 
      [ title ] 
    ]
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
      style [ ("margin-top", "70px") ]
  in
    p 
    [ class_, style_ ] 
    [ text "CtPaint" ]




    