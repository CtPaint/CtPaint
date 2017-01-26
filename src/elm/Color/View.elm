module Color.View exposing (view)


import Html            exposing (..)
import Html.Attributes exposing (..)
import Color.Types     exposing (PrimaryPalette)
import Color           exposing (Color)
import Message         exposing (Msg(..))



view : PrimaryPalette -> List Color -> Html Msg
view primaryPalette generalPalette =
  div
  [ class "palette-container" ]
  []