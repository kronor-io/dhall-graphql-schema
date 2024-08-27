let Map = (../Prelude.dhall).Map.Type

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Directives = ../types/Directives.dhall

let Entry = { mapKey : Text, mapValue : Map Text (Optional Text) }

let toGraphQLDirective = ./toGraphQLDirective.dhall

in  \(directives : Directives) ->
      concatMapSep " " Entry toGraphQLDirective directives
