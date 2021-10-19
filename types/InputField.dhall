let Map = (../Prelude.dhall).Map.Type

let Directives = ./Directives.dhall

in  { type : ./Type.dhall
    , nullable : Bool
    , comment : Optional Text
    , directives : Optional Directives
    }
