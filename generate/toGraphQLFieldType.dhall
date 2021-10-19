let Scalar = ../types/Scalar.dhall

let ListTypeData = ../types/ListTypeData.dhall

let toGraphQLScalar = ./toGraphQLScalar.dhall

let toNonNullable = \(nullable : Bool) -> if nullable then "" else "!"

let FieldType = ../types/Type.dhall

in  \(type : FieldType) ->
    \(nullability : Bool) ->
      merge
        { Scalar =
            \(s : Scalar) -> toGraphQLScalar s ++ toNonNullable nullability
        , List =
            \(data : ListTypeData) ->
                  "[${toGraphQLScalar data.of}${toNonNullable data.nullable}]"
              ++  toNonNullable nullability
        }
        type
