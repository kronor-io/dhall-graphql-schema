let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphQLLabels = ./toGraphQLLabels.dhall

let Enum = ../types/Enum.dhall

in  \(withComments : Bool) ->
    \(data : Enum) ->
      let comment = if withComments then data.comment else None Text

      in  ''
          ${toGraphQLComment comment}
          enum ${data.name} {
          ${toGraphQLLabels withComments data.labels}
          }
          ''
