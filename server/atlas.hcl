// Define an environment named "local"
env "local" {
  schema {
    src = "file://project/schema.pg.hcl"
  }

  url = env("DATABASE_URL")

  

  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}