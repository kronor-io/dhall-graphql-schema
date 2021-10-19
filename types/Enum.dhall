let Map = (../Prelude.dhall).Map.Type

let Label = ./Label.dhall

in  { name : Text, comment : Optional Text, labels : Map Text Label }
