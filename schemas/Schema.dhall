let Schema = ../types/Schema.dhall

let Node = ../types/Node.dhall

in  { Type = Schema
    , default =
      { enums = [] : List Node
      , unions = [] : List Node
      , inputs = [] : List Node
      , mutation = None Node
      }
    }
