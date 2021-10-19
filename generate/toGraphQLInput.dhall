let InputData = ../types/InputData.dhall

let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphQLInputFields = ./toGraphQLInputFields.dhall

in  \(withComments : Bool) ->
    \(data : InputData) ->
      let comment = if withComments then data.comment else None Text

      in  ''
          ${toGraphQLComment comment}
          input ${data.name} {
          ${toGraphQLInputFields withComments data.fields}
          }
          ''
