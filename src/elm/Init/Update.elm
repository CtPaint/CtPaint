module Init.Update exposing (update)


import Model           exposing (Model(..), UninitializedState)
import Message         exposing (Msg(..))
import Init.Main       as Init
import Init.Initialize as Initialize
import Init.SetUp      as SetUp
import Init.Types      exposing (SetUpMsg(CheckIfReady))


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
          
          SetUp.update 
            CheckIfReady
            { state
            | window = 
                let {window} = state in
                { window 
                | size = Just size
                }
            }


    OnWindowResize size ->
      let 
        {window} = state
      in
        Uninitialized
        { state
        | window = 
          { size = Just size }
        } ! []


    _ -> 
      
      Uninitialized state ! []






