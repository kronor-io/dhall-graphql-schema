let Map = (../Prelude.dhall).Map.Type

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Field = ../types/Field.dhall

let Entry = { mapKey : Text, mapValue : Field }

let toGraphQLField = ./toGraphQLField.dhall

let entryToText =
      \(withComments : Bool) ->
      \(entry : Entry) ->
        toGraphQLField withComments entry.mapKey entry.mapValue

in  \(withComments : Bool) ->
    \(fields : Map Text Field) ->
      concatMapSep "\n" Entry (entryToText withComments) fields
