module View.Util exposing (..)


import Html             exposing (Attribute)
import Html.Attributes  exposing (class)



classes : List String -> Attribute a
classes =
  String.join " " >> class


height : Int -> (String, String)
height =
  toString >> (,) "height"


width : Int -> (String, String)
width =
  toString >> (,) "width"


left : Int -> (String, String)
left = 
  toString >> (,) "left"


top : Int -> (String, String)
top =
  toString >> (,) "top"