import Html
import Ports            exposing (..)
import View             exposing (view)
import Init.Main        exposing (initCmd, uninitializedApp, initDev)
import Update           exposing (update)
import Subscriptions    exposing (subscriptions)




main =
  Html.program
  { init = (initDev, initCmd)
  --{ init          = (uninitializedApp, initCmd) 
  , view          = view
  , update        = update
  , subscriptions = subscriptions
  }



