let Schema = ../types/Schema.dhall

let Declaration = ../types/Declaration.dhall

in  { Type = Schema
    , default =
      { enums = [] : List Declaration
      , unions = [] : List Declaration
      , inputs = [] : List Declaration
      , mutation = None Declaration
      }
    }
