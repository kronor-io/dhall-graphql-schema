let Map = (../Prelude.dhall).Map.Type

let concatMapSep = (../Prelude.dhall).Text.concatMapSep

let Label = ../types/Label.dhall

let Enum = ../types/Enum.dhall

let Entry = { mapKey : Text, mapValue : Label }

let entryToText =
    \(entry : Entry) ->
        ''
        ('${entry.mapKey}', '${merge { None = "", Some = \(t : Text) -> t } entry.mapValue.comment}')
        ''

in
    \(data : Enum) ->
        ''
        -- AUTO GENERATED FROM .dhall FILE, DO NOT EDIT MANUALLY

        begin;

            create table if not exists public.${data.tableName} (
                name text_100 not null primary key,
                comment text not null
            );

            insert into public.${data.tableName}
                (name, comment)
                values
                ${concatMapSep "," Entry entryToText data.labels}
                on conflict do nothing;

        commit;
        ''