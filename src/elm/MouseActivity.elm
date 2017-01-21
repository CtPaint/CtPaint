module MouseActivity exposing (update)

import Types.Model exposing (State, Model(..))
import Types.Message exposing (Msg(..), MouseActivity(..))
import ToolBars

update : MouseActivity -> State -> (Model, Cmd Msg)
update activity state =
  case activity of 
    ToolBar msg ->
      ToolBars.update msg state

    WorkArea msg ->
      App state ! []

    NoOp ->
      App state ! []