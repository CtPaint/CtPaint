module Subscriptions exposing (subscriptions)


import Model   exposing (Model(..))
import Message exposing (Msg(..))
import App.Subscriptions as App



subscriptions : Model -> Sub Msg
subscriptions model =

  case model of

    Uninitialized state ->

      Sub.none


    App state -> 

      App.subscriptions state







