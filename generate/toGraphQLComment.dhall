\(comment : Optional Text) ->
  merge
    { None = ""
    , Some =
        \(text : Text) ->
          ''
          """
          ${text}
          """
          ''
    }
    comment
