-- Drop schema named "public"
DROP SCHEMA "public" CASCADE;
-- Create "race" table
CREATE TABLE "sailraceiq"."race" (
  "id" serial NOT NULL,
  "num" character varying(4) NULL,
  "start" timestamptz NULL,
  "regatta_id" integer NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "race_regatta_id_fk" FOREIGN KEY ("regatta_id") REFERENCES "sailraceiq"."race" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);
-- Create "regatta" table
CREATE TABLE "sailraceiq"."regatta" (
  "id" integer NOT NULL,
  "description" character varying(4095) NOT NULL,
  PRIMARY KEY ("id")
);
