let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphQLFieldType = ./toGraphQLFieldType.dhall

let toGraphQLArguments = ./toGraphQLArguments.dhall

let Field = ../types/Field.dhall

in  \(withComments : Bool) ->
    \(name : Text) ->
    \(field : Field) ->
      let comment = if withComments then field.comment else None Text

      in  ''
          ${toGraphQLComment
              comment}${name}${toGraphQLArguments
                                 withComments
                                 field.arguments} : ${toGraphQLFieldType
                                                        field.type
                                                        field.nullable}
          ''
