schema "sailraceiq" {}

table "regatta" {
    schema = schema.sailraceiq
    column "id" {
        type = serial
        null = false
    }
    primary_key {
        columns = [column.id]
    }
}

table "race" {
    schema = schema.sailraceiq
    column "id" {
        type = serial
        null = false
    }
    column "num" {
        type = varchar(4)
        null = true
    }
    column "start" {
        type = timestamptz
        null = true
    }
    column "regatta_id" {
        type = int
        null = false
    }
    primary_key {
        columns = [column.id]
    }
    foreign_key "race_regatta_id_fkey" {
        columns     = [column.regatta_id]
        table       = table.regatta
        ref_columns = [column.id]
        on_delete   = CASCADE
    }
}