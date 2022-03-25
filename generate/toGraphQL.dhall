let Declaration = ../types/Declaration.dhall

let toGraphQLType = ./toGraphQLType.dhall

let toGraphQLEnum = ./toGraphQLEnum.dhall

let toGraphQLUnion = ./toGraphQLUnion.dhall

let toGraphQLInput = ./toGraphQLInput.dhall

let toGraphQL =
      \(withComments : Bool) ->
      \(declaration : Declaration) ->
        merge
          { type = toGraphQLType withComments
          , enum = toGraphQLEnum withComments
          , union = toGraphQLUnion withComments
          , input = toGraphQLInput withComments
          }
          declaration

in  toGraphQL
