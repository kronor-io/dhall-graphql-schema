let Node = ../types/Node.dhall

let toGraphQLType = ./toGraphQLType.dhall

let toGraphQLEnum = ./toGraphQLEnum.dhall

let toGraphQLInput = ./toGraphQLInput.dhall

let toGraphQL =
      \(withComments : Bool) ->
      \(node : Node) ->
        merge
          { type = toGraphQLType withComments
          , enum = toGraphQLEnum withComments
          , input = toGraphQLInput withComments
          }
          node

in  toGraphQL
