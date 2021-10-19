let Map = (../Prelude.dhall).Map.Type

let InputField = ./InputField.dhall

in  { name : Text, comment : Optional Text, fields : Map Text InputField }
