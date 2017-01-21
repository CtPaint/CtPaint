import Html
import Ports            exposing (..)
import View             exposing (view)
import Init.Main        exposing (initCmd, uninitializedApp)
import Update           exposing (update)
import Subscriptions    exposing (subscriptions)




main =
  Html.program
  { init          = (uninitializedApp, initCmd) 
  , view          = view
  , update        = update
  , subscriptions = subscriptions
  }



