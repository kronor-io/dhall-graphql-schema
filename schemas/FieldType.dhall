let Multiplicity = ../types/Multiplicity.dhall

let Declaration = ../types/Declaration.dhall

let TypeData = ../types/TypeData.dhall

let Enum = ../types/Enum.dhall

let InputData = ../types/InputData.dhall

let Scalar = ../types/Scalar.dhall

let Union = ../types/Union.dhall

let nodeToCustom =
      \(node : Declaration) ->
        merge
          { type = \(d : TypeData) -> Scalar.Custom d.name
          , enum = \(d : Enum) -> Scalar.Custom d.name
          , union = \(d : Union) -> Scalar.Custom d.name
          , input = \(d : InputData) -> Scalar.Custom d.name
          }
          node

let Custom = \(name : Text) -> Multiplicity.Single (Scalar.Custom name)

let NonNullableList =
      \(of : Text) ->
        Multiplicity.List { of = Scalar.Custom of, nullable = False }

let List_ =
      \(of : Text) ->
      \(nullable : Bool) ->
        Multiplicity.List { of = Scalar.Custom of, nullable }

let fromDeclaration =
      \(node : Declaration) -> Multiplicity.Single (nodeToCustom node)

let listOfDeclaration =
      \(node : Declaration) ->
      \(nullable : Bool) ->
        Multiplicity.List { of = nodeToCustom node, nullable }

let nonNullablelistOfDeclaration =
      \(node : Declaration) ->
        Multiplicity.List { of = nodeToCustom node, nullable = False }

let fromScalar = \(node : Scalar) -> Multiplicity.Single node

let listOfScalar =
      \(node : Scalar) -> Multiplicity.List { of = node, nullable = True }

let nonNullableListOfScalar =
      \(node : Scalar) -> Multiplicity.List { of = node, nullable = False }

in  { Int = Multiplicity.Single Scalar.Int
    , String = Multiplicity.Single Scalar.String
    , Boolean = Multiplicity.Single Scalar.Boolean
    , ID = Multiplicity.Single Scalar.ID
    , Float = Multiplicity.Single Scalar.Float
    , Custom
    , List = List_
    , NonNullableList
    , fromDeclaration
    , listOfDeclaration
    , nonNullablelistOfDeclaration
    , fromScalar
    , listOfScalar
    , nonNullableListOfScalar
    }
