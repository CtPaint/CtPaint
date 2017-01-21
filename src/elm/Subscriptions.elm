module Subscriptions exposing (subscriptions)


import Types.Model exposing (Model(..))
import Types.Message exposing (Msg(..))
import App.Subscriptions as App

import Mouse
import Window 



subscriptions : Model -> Sub Msg
subscriptions model =
  case model of
    Uninitialized state ->
      Sub.none

    App state -> 
      App.subscriptions state







