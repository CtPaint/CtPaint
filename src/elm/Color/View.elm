module Color.View exposing (view)


import Html            exposing (..)
import Html.Attributes exposing (..)
import Color.Types     exposing (PrimaryPalette)
import Color           exposing (Color)
import Message         exposing (Msg(..))
import Color.Util      as Color

import Debug exposing (log)



view : PrimaryPalette -> List Color -> Html Msg
view primaryPalette generalPalette =
  div
  [ class "palette-container" ]
  [ topRow primaryPalette.tl primaryPalette.tr
  ]


topRow : Color -> Color -> Html Msg
topRow left right =
  div
  [ class "primary-top-row" ]
  [ div
    [ class "primary-swatch tl"
    , style 
      [ ("background", Color.toHex left) ]
    ]
    []
  , div
    [ class "primary-swatch tr"
    , style 
      [ ("background", Color.toHex right) ]
    ]
    []
  ]