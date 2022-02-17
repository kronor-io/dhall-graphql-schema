let Node = ./Node.dhall

let Scalar = ./Scalar.dhall

in  { enums : List Node
    , inputs : List Node
    , scalars : List Scalar
    , types : List Node
    , query : Node
    , mutation : Optional Node
    }
