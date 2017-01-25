module View exposing (view)


import Html       exposing (..)
import Init.View  as Init
import App.View   as App
import Model      exposing (Model(..))
import Message    exposing (Msg(..))



view : Model -> Html Msg
view model = 

  case model of 
  
    Uninitialized state ->
  
      Init.view state


    App state ->

      App.view state






