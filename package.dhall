{ Node = ./schemas/Node.dhall
, Enum = ./schemas/Enum.dhall
, Input = ./schemas/Input.dhall
, Field = ./schemas/Field.dhall
, InputField = ./schemas/InputField.dhall
, Label = ./schemas/Label.dhall
, FieldType = ./schemas/FieldType.dhall
, Scalar = ./types/Scalar.dhall
, Schema = ./schemas/Schema.dhall
, toGraphQLSchema = ./generate/toGraphQLSchema.dhall
, toGraphQL = ./generate/toGraphQL.dhall
, emptyDirective = [] : List { mapKey : Text, mapValue : Text }
}
