let Map = (../Prelude.dhall).Map.Type

let Label = ./Label.dhall

in  { name : Text, tableName : Text, comment : Optional Text, labels : Map Text Label }