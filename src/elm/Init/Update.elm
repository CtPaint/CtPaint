module Init.Update exposing (update)


import Types.Model   exposing (Model(..), UninitializedState)
import Types.Message exposing (Msg(..))
import ParseInt      exposing (parseInt)
import Init.Main       as Init
import Init.Initialize as Initialize
import String
import Char



update : Msg -> UninitializedState -> (Model, Cmd Msg)
update message state =

  case message of
  
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
          |> update CheckIfReady


    CheckIfReady ->

      Uninitialized 
      { state
      | ready =
          List.foldr (&&) True  
          [ state.window.size /= Nothing
          , state.projectName /= ""
          , state.canvasSize.width > 0
          , state.canvasSize.height > 0
          ]
      } ! []


    SetProjectName str ->

      update
        CheckIfReady
        { state | projectName = str }


    SetProjectWidth str ->

      case parseInt str of
        
        Ok i ->
          let 
            {canvasSize} = state 
          in
            update
              CheckIfReady
              { state 
              | canvasSize = 
                { canvasSize
                | width = i
                }
              }   
        
        Err _ ->
        
          Uninitialized state ! [] 


    SetProjectHeight str ->

      case parseInt str of
        
        Ok i ->
          let 
            {canvasSize} = state 
          in
            update
              CheckIfReady
              { state 
              | canvasSize = 
                { canvasSize
                | height = i
                }
              }   
        
        Err _ ->
        
          Uninitialized state ! [] 


    SetProjectBackground color ->
      
      Uninitialized
      { state
      | initColor = color
      } ! []


    StartApp ->
      Initialize.from state ! []


    _ -> 
      
      Uninitialized state ! []



onlyDigits : String -> Bool
onlyDigits =
  String.foldr 
    ((&&) << Char.isDigit)
    True





