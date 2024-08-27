let Map = (../Prelude.dhall).Map.Type

let L = (../Prelude.dhall).List

let O = (../Prelude.dhall).Optional

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Entry = { mapKey : Text, mapValue : Map Text (Optional Text) }

let Argument = { mapKey : Text, mapValue : (Optional Text) }

let toArgument = \(arg : Argument) ->
    let argText : Optional Text = O.map Text Text (\(v : Text) -> "\"${v}\"") arg.mapValue
    in "${arg.mapKey}: ${O.default Text "null" argText}"

let makeArguments =
      \(args : Map Text (Optional Text)) ->
        if    L.null Argument args
        then  ""
        else  "(" ++ concatMapSep " ," Argument toArgument args ++ ")"

in  \(directive : Entry) ->
      "@${directive.mapKey}${makeArguments directive.mapValue}"
