let NodeData = ../types/NodeData.dhall

let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphQLFields = ./toGraphQLFields.dhall

in  \(withComments : Bool) ->
    \(data : NodeData) ->
      let comment = if withComments then data.comment else None Text

      in  ''
          ${toGraphQLComment comment}type ${data.name} {

          ${toGraphQLFields withComments data.fields}
          }
          ''
