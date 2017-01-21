module View exposing (view)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (on, onInput, keyCode, onMouseDown)
import Types.Model exposing (Model(..))
import Types.Message exposing (Msg (..))
import Json.Decode as Json
import Canvas exposing (Canvas, toHtml)
import Init.View as Init
import App.View as App


-- VIEW


view : Model -> Html Msg
view model = 
  case model of 
    Uninitialized state ->
      Init.view state

    App state ->
      App.view state

