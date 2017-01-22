module View.Util exposing (..)

import Html             exposing (Attribute)
import Html.Attributes  exposing (class)
--import Html.Events      exposing (..)
--import Types.Model exposing (Model(..))
import Types.Message exposing (Msg (..))



classes : List String -> Attribute a
classes =
  String.join " " >> class