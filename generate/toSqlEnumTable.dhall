let Map = (../Prelude.dhall).Map.Type

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Label = ../types/Label.dhall

let Enum = ../types/Enum.dhall

let GraphQL = ../package.dhall

let Entry = { mapKey : Text, mapValue : Label }

let entryToText =
    \(entry : Entry) ->
        ''
        ('${entry.mapKey}', '${merge { None = "", Some = \(t : Text) -> t } entry.mapValue.comment}')
        ''

-- TODO: convert data.name to snake case
let toSqlEnumTable =
    \(data : Enum) ->
        ''
        -- AUTO GENERATED FROM .dhall FILE, DO NOT EDIT MANUALLY

        begin;

            create table if not exists public.${data.name} (
                name text_100 not null primary key,
                comment text not null
            );

            insert into public.${data.name}
                (name, comment)
                values
                ${concatMapSep "," Entry entryToText data.labels}
                on conflict do nothing;

        commit;
        ''


let country =
    -- GraphQL.Enum.new
        GraphQL.Enum::{
        , name = "payment_method"
        , comment = Some "Supported countries"
        , labels = toMap
            { DK = GraphQL.Label::{ name = "DK" }
            , IS = GraphQL.Label::{ name = "IS" }
            , NO = GraphQL.Label::{ name = "NO" }
            , SE = GraphQL.Label::{ name = "SE", comment = Some "number 1" }
            }
        }


in  { country = toSqlEnumTable country
    }
