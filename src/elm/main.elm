import Html
import Types            exposing (..)
import Ports            exposing (..)
import View             exposing (view)
import MouseActivity
import Mouse




-- MAIN


main =
  Html.program
  { init          = (init, Cmd.none) 
  , view          = view
  , update        = update
  , subscriptions = subscriptions
  }


init : Model
init =
  { toolBars =
    { width = 29
    , height = 58
    }
  , globalMouseMsgs =
    { down = NoOp
    , up   = NoOp
    , move = always NoOp
    }
  }

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions {globalMouseMsgs} =
  Sub.batch
  [ Mouse.moves 
      (globalMouseMsgs.move >> Mouse)
  , Mouse.ups 
      (Mouse << always globalMouseMsgs.up)
  , Mouse.downs 
      (Mouse << always globalMouseMsgs.down)
  ]


-- UPDATE


update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of 

    Mouse activity ->
      MouseActivity.update activity model


