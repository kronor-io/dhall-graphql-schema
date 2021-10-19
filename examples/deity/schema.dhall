let GraphQL = ../../package.dhall

let Deity =
      GraphQL.Node.new
        GraphQL.Node::{
        , name = "Deity"
        , comment = Some "Description for Deity"
        , fields = toMap
            { name = GraphQL.Field::{
              , comment = Some "The name of this deity"
              , type = GraphQL.FieldType.String
              , nullable = False
              }
            , power = GraphQL.Field::{ type = GraphQL.FieldType.String }
            }
        }

let Query =
      GraphQL.Node.new
        GraphQL.Node::{
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
      GraphQL.Schema::{ types = [ Deity, Query ], query = "Query" }
