module Update exposing (update)

import Types.Model   exposing (Model(..))
import Types.Message exposing (Msg(..))
import Init.Update   as Init
import App.Update    as App



update : Msg -> Model -> (Model, Cmd Msg)
update message model =

  case model of
  
    Uninitialized state ->
  
      Init.update message state 


    App state ->

      App.update message state


