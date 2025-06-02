schema "sailraceiq" {}

table "regatta" {
    schema = schema.sailraceiq
    column "id" {
        type = int
        null = false
    }
    column "description" {
        type = varchar(4095)
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
    foreign_key "race_regatta_id_fk" {
        columns     = [column.regatta_id]
        ref_columns = [column.id]
        on_delete   = CASCADE
    }
}