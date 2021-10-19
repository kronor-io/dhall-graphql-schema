let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Node = ../types/Node.dhall

let Schema =
      { enums : List Node
      , inputs : List Node
      , types : List Node
      , query : Text
      , mutation : Optional Text
      }

let toGraphQL = ./toGraphQL.dhall

in  \(withComments : Bool) ->
    \(schema : Schema) ->
      let mutation =
            merge
              { None = "", Some = \(m : Text) -> "mutation: ${m}" }
              schema.mutation

      in  ''
          ${concatMapSep "\n" Node (toGraphQL withComments) schema.enums}
          ${concatMapSep "\n" Node (toGraphQL withComments) schema.inputs}
          ${concatMapSep "\n" Node (toGraphQL withComments) schema.types}
          schema {
            query: ${schema.query}
            ${mutation}
          }
          ''
