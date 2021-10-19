let Node = ./Node.dhall

in  { enums : List Node
    , inputs : List Node
    , types : List Node
    , query : Node
    , mutation : Optional Node
    }
