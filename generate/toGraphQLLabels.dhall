let Map = (../Prelude.dhall).Map.Type

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Label = ../types/Label.dhall

let Entry = { mapKey : Text, mapValue : Label }

let toGraphQLComment = ./toGraphQLComment.dhall

let entryToText =
      \(withComments : Bool) ->
      \(entry : Entry) ->
        let comment = if withComments then entry.mapValue.comment else None Text

        in  ''
            ${toGraphQLComment comment}
            ${entry.mapKey}
            ''

in  \(withComments : Bool) ->
    \(labels : Map Text Label) ->
      concatMapSep "" Entry (entryToText withComments) labels
