# Dhall GraphQL schema generator

You can use this package to create GraphQL schemas using dhall.

## Why

While GraphQL schemas are easy to write by hand and are already declarative,
you may need to create multiple similar schemas programatically out of a single
source of truth.

One example would be generating different schemas for each permission level in
your application. This is the case in [Hasura](https://hasura.io), where you
need to provide different GraphQL schema documents for each role.

## Known missing features:

* Unions
* Subscriptions
