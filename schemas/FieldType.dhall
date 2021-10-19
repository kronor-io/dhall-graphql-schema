let FieldType = ../types/Type.dhall

let Node = ../types/Node.dhall

let NodeData = ../types/NodeData.dhall

let Enum = ../types/Enum.dhall

let InputData = ../types/InputData.dhall

let Scalar = ../types/Scalar.dhall

let nodeToCustom =
      \(node : Node) ->
        merge
          { type = \(d : NodeData) -> Scalar.Custom d.name
          , enum = \(d : Enum) -> Scalar.Custom d.name
          , input = \(d : InputData) -> Scalar.Custom d.name
          }
          node

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
    , Node = \(node : Node) -> FieldType.Scalar (nodeToCustom node)
    , NodeList =
        \(node : Node) ->
        \(nullable : Bool) ->
          FieldType.List { of = nodeToCustom node, nullable }
    , NonNullableNodeList =
        \(node : Node) ->
          FieldType.List { of = nodeToCustom node, nullable = False }
    }
