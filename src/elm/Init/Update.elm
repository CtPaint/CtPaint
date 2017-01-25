module Init.Update exposing (update)


import Types.Model   exposing (Model(..), UninitializedState)
import Types.Message exposing (Msg(..))
import Init.Main       as Init
import Init.Initialize as Initialize
import Init.SetUp      as SetUp
import Init.Types      exposing (SetUpMsg(CheckIfReady))
import String
import Char



update : Msg -> UninitializedState -> (Model, Cmd Msg)
update message state =

  case message of

    SetUp setUpMsg ->

      SetUp.update setUpMsg state
  

    GetWindowSize result ->
  
      case Result.toMaybe result of
  
        Nothing ->
  
          (Uninitialized state) ! [ Init.getWindowSize ]
  

        Just size ->

          { state
          | window = 
              let {window} = state in
              { window 
              | size = Just size
              }
          }
          |> SetUp.update CheckIfReady


    _ -> 
      
      Uninitialized state ! []



onlyDigits : String -> Bool
onlyDigits =
  String.foldr 
    ((&&) << Char.isDigit)
    True





