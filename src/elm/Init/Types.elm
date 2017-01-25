module Init.Types exposing (..)





type InitColor
  = Black
  | White
  | Transparent



type SetUpMsg 
  = CheckIfReady
  | SetProjectName String
  | SetProjectWidth String
  | SetProjectHeight String
  | SetProjectBackground InitColor
  | StartApp