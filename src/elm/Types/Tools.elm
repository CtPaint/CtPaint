module Types.Tools exposing 
  ( getTool
  , Tool
  , Tools
  , ToolName(..)
  , tools
  )


import Dict exposing (Dict, fromList)
import Debug 


(:=) = (,)

type ToolName
  = Select
  | Zoom
  | Move

type alias Tools =
  { select : Tool
  , move   : Tool
  , zoom   : Tool
  }

type alias Tool =
  { name : ToolName
  , icon : String
  --, mouseMsgs :
    --{ canvas : 
    --  { up : Positon -> Msg 
    --  , down : Position -> Msg
    --  , move : Position -> Msg
    --  }
    --, subs :
    --  { up : Positon -> Msg 
    --  , down : Position -> Msg
    --  , move : Position -> Msg
    --  }
    --}
  }

--select : Tool
--select = 
--  { name = Select 
--  , icon = "\xEA1A"
--  , mouseMsgs = 
--    { canvas }
--  }


getTool : ToolName -> Tool
getTool tn =
  case Dict.get (toString tn) toolsDict of
    Nothing ->
      let 
        _ = Debug.log "TOOL DOESNT EXIST!" 
      in
        Tool
          Select
          "\xEA1A"

    Just tool ->
      tool

tools : List Tool
tools =
  [ { name = Select
    , icon = "\xEA1A" 
    }
  , { name = Zoom
    , icon = "\xEA17" 
    }
  , { name = Move
    , icon = "\xEA0A"
    }
  ]

toolsDict : Dict String Tool
toolsDict =
  Dict.fromList (List.map toolsHelp tools)


toolsHelp : Tool -> (String, Tool)
toolsHelp t =
  (toString t.name, t)
