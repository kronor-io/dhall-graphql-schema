let Map = (../Prelude.dhall).Map.Type

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Field = ../types/InputField.dhall

let Entry = { mapKey : Text, mapValue : Field }

let toGraphQLInputField = ./toGraphQLInputField.dhall

let entryToText =
      \(withComments : Bool) ->
      \(entry : Entry) ->
        toGraphQLInputField withComments entry.mapKey entry.mapValue

in  \(withComments : Bool) ->
    \(fields : Map Text Field) ->
      concatMapSep "\n" Entry (entryToText withComments) fields
