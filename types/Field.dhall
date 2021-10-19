let Map = (../Prelude.dhall).Map.Type

let Argument = ./InputField.dhall

in  { type : ./Type.dhall
    , nullable : Bool
    , comment : Optional Text
    , arguments : Optional (Map Text Argument)
    }
