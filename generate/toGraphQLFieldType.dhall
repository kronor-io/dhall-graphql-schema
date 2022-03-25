let Scalar = ../types/Scalar.dhall

let Union = ../types/Union.dhall

let ListTypeData = ../types/ListTypeData.dhall

let toGraphQLScalar = ./toGraphQLScalar.dhall

let toNonNullable = \(nullable : Bool) -> if nullable then "" else "!"

let Multiplicity = ../types/Multiplicity.dhall

in  \(type : Multiplicity) ->
    \(nullability : Bool) ->
      merge
        { Single =
            \(s : Scalar) -> toGraphQLScalar s ++ toNonNullable nullability
        , List =
            \(data : ListTypeData) ->
                  "[${toGraphQLScalar data.of}${toNonNullable data.nullable}]"
              ++  toNonNullable nullability
        }
        type
