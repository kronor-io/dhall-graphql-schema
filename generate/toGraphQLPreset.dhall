\(preset : Optional Text) ->
  merge
    { None = "", Some = \(text : Text) -> " @preset(value: \"${text}\")" }
    preset
