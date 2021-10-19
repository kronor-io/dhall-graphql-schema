let Map = (../Prelude.dhall).Map.Type

let L = (../Prelude.dhall).List

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Entry = { mapKey : Text, mapValue : Map Text Text }

let Argument = { mapKey : Text, mapValue : Text }

let toArgument = \(arg : Argument) -> "${arg.mapKey}: \"${arg.mapValue}\""

let makeArguments =
      \(args : Map Text Text) ->
        if    L.null Argument args
        then  ""
        else  "(" ++ concatMapSep " ," Argument toArgument args ++ ")"

in  \(directive : Entry) ->
      "@${directive.mapKey}${makeArguments directive.mapValue}"
