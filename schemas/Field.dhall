let Map = (../Prelude.dhall).Map.Type

let Argument = ../types/InputField.dhall

in  { Type = ../types/Field.dhall
    , default.comment = None Text
    , default.arguments = None (Map Text Argument)
    , default.nullable = False
    }
