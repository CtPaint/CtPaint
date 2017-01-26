module Keyboard.Update exposing (update)


import Keyboard exposing (KeyCode)
import Keyboard.Types exposing (KeyboardDir(..))
import Model exposing (State, Model(..))
import Message exposing (Msg(..))
import Tools.Tools as Tools 
import Char


update : KeyCode -> KeyboardDir -> State -> (Model, Cmd Msg)
update code dir state =
 
  case Char.fromCode code of
  
    'P' ->

      case dir of

        Down -> 

          App state ! []


        Up ->

          App
          { state
          | tool = Tools.pencil
          } ! []


    'H' ->

      case dir of

        Down -> 

          App state ! []


        Up ->

          App
          { state
          | tool = Tools.hand
          } ! []


    _ -> 

      App state ! []






