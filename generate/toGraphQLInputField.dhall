let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphQLFieldType = ./toGraphQLFieldType.dhall

let toGraphQLPreset = ./toGraphQLPreset.dhall

let InputField = ../types/InputField.dhall

in  \(withComments : Bool) ->
    \(name : Text) ->
    \(field : InputField) ->
      let comment = if withComments then field.comment else None Text

      in  ''
          ${toGraphQLComment comment}
            ${name} : ${toGraphQLFieldType
                          field.type
                          field.nullable}${toGraphQLPreset field.preset}
          ''
