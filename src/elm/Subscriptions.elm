module Subscriptions exposing (subscriptions)


import Types.Model exposing (Model(..))
import Types.Message exposing (Msg(..))

import Mouse
import Window 



subscriptions : Model -> Sub Msg
subscriptions model =
  case model of
    Uninitialized state ->
      Sub.none

    App state -> 
      let {mouseSubs} = state in
      Sub.batch
      [ mouseSubs.move
        >> Mouse |> Mouse.moves
      , always mouseSubs.up 
        >> Mouse |> Mouse.ups
      , always mouseSubs.down 
        >> Mouse |> Mouse.downs
      , Window.resizes OnWindowResize
      ]







