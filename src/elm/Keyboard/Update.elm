module Keyboard.Update exposing (update)


import Keyboard       exposing (KeyCode)
import Keyboard.Types exposing (KeyboardDir(..))
import Model          exposing (State, Model(..))
import Message        exposing (Msg(..))
import Tools.Tools    as Tools 
import Tools.Types    exposing (Tool)
import Char


update : KeyCode -> KeyboardDir -> State -> (Model, Cmd Msg)
update code dir state =
 
  case Char.fromCode code of
  
    'P' ->

      setTool dir Tools.pencil state


    'H' ->

      setTool dir Tools.hand state



    _ -> 

      App state ! []



setTool : KeyboardDir -> Tool -> State -> (Model, Cmd Msg)
setTool dir tool state =

  case dir of

    Down -> 

      App state ! []


    Up ->

      App
      { state
      | tool = tool
      } ! []


