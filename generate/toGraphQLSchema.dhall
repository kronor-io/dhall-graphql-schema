let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Declaration = ../types/Declaration.dhall

let Scalar = ../types/Scalar.dhall

let TypeData = ../types/TypeData.dhall

let Enum = ../types/Enum.dhall

let InputData = ../types/InputData.dhall

let Schema = ../types/Schema.dhall

let Union = ../types/Union.dhall

let toGraphQL = ./toGraphQL.dhall

let toGraphQLScalar = ./toGraphQLScalar.dhall

let extractDeclarationName =
      \(declaration : Declaration) ->
        merge
          { type = \(d : TypeData) -> d.name
          , enum = \(d : Enum) -> "error: cannot use an enum at this level"
          , union = \(d : Union) -> "error: cannot use a union at this level"
          , input =
              \(d : InputData) -> "error: cannot use an input at this level"
          }
          declaration

in  \(withComments : Bool) ->
    \(schema : Schema) ->
      let query = extractDeclarationName schema.query

      let mutation =
            merge
              { None = ""
              , Some = \(m : Declaration) -> "mutation: ${extractDeclarationName m}"
              }
              schema.mutation

      in  ''
          ${concatMapSep
              "\n"
              Scalar
              (\(x : Scalar) -> "scalar " ++ toGraphQLScalar x)
              schema.scalars}
          ${concatMapSep "\n" Declaration (toGraphQL withComments) schema.enums}
          ${concatMapSep "\n" Declaration (toGraphQL withComments) schema.unions}
          ${concatMapSep "\n" Declaration (toGraphQL withComments) schema.inputs}
          ${concatMapSep "\n" Declaration (toGraphQL withComments) schema.types}
          schema {
            query: ${query}
            ${mutation}
          }
          ''
