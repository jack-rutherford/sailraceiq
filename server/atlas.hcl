// Define an environment named "local"
env "local" {
  schema {
    src = "file://schema.pg.hcl"
  }

  url = "postgresql://user:password@db:5432/sailraceiq?search_path=sailraceiq"

  dev = "docker://postgres/16/dev?search_path=sailraceiq"

  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}