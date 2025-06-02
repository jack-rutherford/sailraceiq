// Define an environment named "local"
env "local" {
  schema {
    src = "file://schema.pg.hcl"
  }

  url = "postgresql://postgres:password@db:5432/sailraceiq"

  dev = "docker://postgres/16/dev"

  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}