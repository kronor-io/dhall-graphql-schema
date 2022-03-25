let Declaration = ./Declaration.dhall

let Scalar = ./Scalar.dhall

in  { enums : List Declaration
    , unions : List Declaration
    , inputs : List Declaration
    , scalars : List Scalar
    , types : List Declaration
    , query : Declaration
    , mutation : Optional Declaration
    }
