let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphQLFieldType = ./toGraphQLFieldType.dhall

let toGraphQLArguments = ./toGraphQLArguments.dhall

let Field = ../types/Field.dhall

let Directives = ../types/Directives.dhall

let toGraphQLDirectives = ./toGraphQLDirectives.dhall

let toDirectives =
      \(d : Optional Directives) ->
        merge
          { None = ""
          , Some = \(ds : Directives) -> " ${toGraphQLDirectives ds}"
          }
          d

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
                                                        field.nullable}${toDirectives
                                                                           field.directives}
          ''
