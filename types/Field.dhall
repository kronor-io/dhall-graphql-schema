let Map = (../Prelude.dhall).Map.Type

let Argument = ./InputField.dhall

let Directives = ./Directives.dhall

in  { type : ./Type.dhall
    , nullable : Bool
    , comment : Optional Text
    , arguments : Optional (Map Text Argument)
    , directives : Optional Directives
    }
