let Directives = ../types/Directives.dhall

in  { Type = ../types/InputField.dhall
    , default.comment = None Text
    , default.nullable = False
    , default.directives = None Directives
    }
