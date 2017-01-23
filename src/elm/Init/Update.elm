module Init.Update exposing (update)


import Types.Model   exposing (Model(..), UninitializedState)
import Types.Message exposing (Msg(..))
import Init.Main as Init
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
          , state.canvasSize.width /= ""
          , state.canvasSize.height /= ""
          , state.projectName /= ""
          ]
      } ! []


    SetProjectName str ->

      update
        CheckIfReady
        { state | projectName = str }


    SetProjectWidth str ->

      if onlyDigits str then
        let 
          {canvasSize} = state 
        in
          update
            CheckIfReady
            { state 
            | canvasSize = 
              { canvasSize
              | width = str
              }
            }   
      else

        Uninitialized state ! [] 


    SetProjectHeight str ->

      if onlyDigits str then
        let 
          {canvasSize} = state 
        in
          update
            CheckIfReady
            { state 
            | canvasSize = 
              { canvasSize
              | height = str
              }
            }   
      else

        Uninitialized state ! [] 


    SetProjectBackground color ->
      
      Uninitialized
      { state
      | initColor = color
      } ! []


    _ -> 
      
      Uninitialized state ! []



onlyDigits : String -> Bool
onlyDigits =
  String.foldr 
    ((&&) << Char.isDigit)
    True





