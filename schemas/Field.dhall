let Map = (../Prelude.dhall).Map.Type

let Argument = ../types/InputField.dhall

let Directives = ../types/Directives.dhall

in  { Type = ../types/Field.dhall
    , default.comment = None Text
    , default.arguments = None (Map Text Argument)
    , default.nullable = False
    , default.directives = None Directives
    }
