let toGraphQLComment = ./toGraphQLComment.dhall

let toGraphQLFieldType = ./toGraphQLFieldType.dhall

let toGraphQLDirectives = ./toGraphQLDirectives.dhall

let InputField = ../types/InputField.dhall

let Directives = ../types/Directives.dhall

let toDirectives =
      \(d : Optional Directives) ->
        merge
          { None = ""
          , Some = \(ds : Directives) -> " ${toGraphQLDirectives ds}"
          }
          d

in  \(withComments : Bool) ->
    \(name : Text) ->
    \(field : InputField) ->
      let comment = if withComments then field.comment else None Text

      in  ''
          ${toGraphQLComment comment}
            ${name} : ${toGraphQLFieldType
                          field.type
                          field.nullable}${toDirectives field.directives}
          ''
