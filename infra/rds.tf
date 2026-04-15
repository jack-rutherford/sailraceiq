# ------------------------
# RDS PostgreSQL Instance
# ------------------------

resource "aws_db_subnet_group" "main" {
  name       = "sailraceiq-db-subnet-group"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "sailraceiq-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "sailraceiq-db"
  engine                 = "postgres"
  engine_version         = "16.6"
  instance_class         = "db.t3.micro" # Free tier eligible
  allocated_storage      = 20
  username               = "postgres"
  password               = "password"
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "sailraceiq-db"
  }
}
