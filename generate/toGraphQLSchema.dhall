let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Node = ../types/Node.dhall

let Scalar = ../types/Scalar.dhall

let TypeData = ../types/TypeData.dhall

let Enum = ../types/Enum.dhall

let InputData = ../types/InputData.dhall

let Schema = ../types/Schema.dhall

let toGraphQL = ./toGraphQL.dhall

let toGraphQLScalar = ./toGraphQLScalar.dhall

let extractNodeName =
      \(node : Node) ->
        merge
          { type = \(d : TypeData) -> d.name
          , enum = \(d : Enum) -> "error: cannot use an enum at this level"
          , input =
              \(d : InputData) -> "error: cannot use an input at this level"
          }
          node

in  \(withComments : Bool) ->
    \(schema : Schema) ->
      let query = extractNodeName schema.query

      let mutation =
            merge
              { None = ""
              , Some = \(m : Node) -> "mutation: ${extractNodeName m}"
              }
              schema.mutation

      in  ''
          ${concatMapSep
              "\n"
              Scalar
              (\(x : Scalar) -> "scalar " ++ toGraphQLScalar x)
              schema.scalars}
          ${concatMapSep "\n" Node (toGraphQL withComments) schema.enums}
          ${concatMapSep "\n" Node (toGraphQL withComments) schema.inputs}
          ${concatMapSep "\n" Node (toGraphQL withComments) schema.types}
          schema {
            query: ${query}
            ${mutation}
          }
          ''
