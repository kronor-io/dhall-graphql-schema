let Scalar = ../types/Scalar.dhall

in  \(s : Scalar) ->
      merge
        { Int = "Int"
        , Float = "Float"
        , String = "String"
        , Boolean = "Boolean"
        , ID = "ID"
        , Custom = \(name : Text) -> name
        }
        s
