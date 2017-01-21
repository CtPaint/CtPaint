module Init.Update exposing (update)


import Types.Model   exposing (Model(..), UninitializedState)
import Types.Message exposing (Msg(..))
import Init.Main as Init


update : Msg -> UninitializedState -> (Model, Cmd Msg)
update message state =
  case message of
    GetWindowSize result ->
      case Result.toMaybe result of
        Nothing ->
          (Uninitialized state) ! [ Init.getWindowSize ]
        Just size ->
          Init.tryInitialization 
          { state
          | window = 
              let {window} = state in
              { window 
              | size = Just size
              }
          } ! []

    _ -> 
      Uninitialized state ! []

