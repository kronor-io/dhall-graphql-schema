let Union = ../types/Union.dhall

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let identity = (../Prelude.dhall).Function.identity

let toGraphQLComment = ./toGraphQLComment.dhall

in  \(withComments : Bool) ->
    \(data : Union) ->
      let comment = if withComments then data.comment else None Text

      let types = concatMapSep " | " Text (identity Text) data.values

      in  ''
          ${toGraphQLComment comment}union ${data.name} = ${types}
          ''
