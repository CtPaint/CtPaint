module ToolBars exposing (update)

import Types exposing (..)

update : ToolBarMsg -> Model -> (Model, Cmd Msg)
update message model =
  case message of
    HorizontalBarResize mouseDirection ->
      case mouseDirection of
        Down ->
          let {globalMouseMsgs} = model in
          { model
          | globalMouseMsgs =
            { globalMouseMsgs
            | move =
                Move
                >>HorizontalBarResize
                >>ToolBar
            }
          } ! []

        Move position ->
          let 
            {toolBars, globalMouseMsgs} = 
              model 
          in
          { model
          | toolBars =
            { toolBars
            | height = 
                position.y
            }
          } ! []

        Up ->
          model ! []
