let GraphQL = ../../package.dhall

let Deity =
      GraphQL.GQLType.new
        GraphQL.GQLType::{
        , name = "Deity"
        , comment = Some "Description for Deity"
        , fields = toMap
            { name = GraphQL.Field::{
              , comment = Some "The name of this deity"
              , type = GraphQL.FieldType.String
              , nullable = False
              }
            , power = GraphQL.Field::{
              , type = GraphQL.FieldType.String
              , directives = Some
                  ( toMap
                      { deprecated = toMap
                          { reason = Some "all deities now have the same power" }
                      }
                  )
              }
            }
        }

let Query =
      GraphQL.GQLType.new
        GraphQL.GQLType::{
        , name = "Query"
        , fields = toMap
            { deity = GraphQL.Field::{
              , comment = Some "Get a deity by name"
              , type = GraphQL.FieldType.Node Deity
              , nullable = False
              , arguments = Some
                  ( toMap
                      { name = GraphQL.InputField::{
                        , type = GraphQL.FieldType.String
                        , nullable = False
                        }
                      }
                  )
              }
            , power = GraphQL.Field::{ type = GraphQL.FieldType.String }
            }
        }

in  GraphQL.toGraphQLSchema
      True
      GraphQL.Schema::{ types = [ Deity, Query ], query = Query }
