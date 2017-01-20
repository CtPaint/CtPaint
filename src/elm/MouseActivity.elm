module MouseActivity exposing (update)

import Types exposing (..)
import ToolBars

update : MouseActivity -> Model -> (Model, Cmd Msg)
update activity model =
  case activity of 
    ToolBar msg ->
      ToolBars.update msg model

    NoOp ->
      model ! []