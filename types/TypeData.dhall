let Map = (../Prelude.dhall).Map.Type

let Field = ./Field.dhall

in  { name : Text, comment : Optional Text, fields : Map Text Field }
