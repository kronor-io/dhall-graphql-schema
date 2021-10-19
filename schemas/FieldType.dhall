let FieldType = ../types/Type.dhall

let Scalar = ../types/Scalar.dhall

in  { Int = FieldType.Scalar Scalar.Int
    , String = FieldType.Scalar Scalar.String
    , Boolean = FieldType.Scalar Scalar.Boolean
    , ID = FieldType.Scalar Scalar.ID
    , Float = FieldType.Scalar Scalar.Float
    , Custom = \(name : Text) -> FieldType.Scalar (Scalar.Custom name)
    , NonNullableList =
        \(of : Scalar) -> FieldType.List { of, nullable = False }
    , List =
        \(of : Scalar) -> \(nullable : Bool) -> FieldType.List { of, nullable }
    }
