module Color.View exposing (view)


import Html            exposing (..)
import Html.Attributes exposing (..)
import Color.Types     exposing (PrimaryPalette)
import Color           exposing (Color)
import Message         exposing (Msg(..))
import Color.Util      as Color



view : PrimaryPalette -> List Color -> Html Msg
view primaryPalette generalPalette =
  div
  [ class "palette-container" ]
  [ primary primaryPalette
  ]


primary : PrimaryPalette -> Html Msg
primary {tl, tr, bl, br} =
  div
  [ class "primary-top-row" ]
  [ div
    [ class "primary-swatch tl"
    , style 
      [ ("background", Color.toHex tl) ]
    ]
    []
  , div
    [ class "primary-swatch tr"
    , style 
      [ ("background", Color.toHex tr) ]
    ]
    []
  , div
    [ class "primary-swatch bl" 
    , style 
      [ ("background", Color.toHex bl) ]
    ]
    []
  , div
    [ class "primary-swatch br" 
    , style 
      [ ("background", Color.toHex br) ]
    ]
    []
  ]