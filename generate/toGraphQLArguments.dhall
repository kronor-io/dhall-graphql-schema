let Map = (../Prelude.dhall).Map.Type

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Argument = ../types/InputField.dhall

let Entry = { mapKey : Text, mapValue : Argument }

let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphqlFieldType = ./toGraphQLFieldType.dhall

let entryToText =
      \(withComments : Bool) ->
      \(entry : Entry) ->
        let name = entry.mapKey

        let value = entry.mapValue

        let comment = if withComments then value.comment else None Text

        in  ''
            ${toGraphQLComment comment}
              ${name} : ${toGraphqlFieldType value.type value.nullable}
            ''

in  \(withComments : Bool) ->
    \(arguments : Optional (Map Text Argument)) ->
      merge
        { None = ""
        , Some =
            \(args : Map Text Argument) ->
                  ''
                  (
                  ''
              ++  concatMapSep "," Entry (entryToText withComments) args
              ++  "  )"
        }
        arguments
