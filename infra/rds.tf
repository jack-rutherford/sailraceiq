# ------------------------
# Networking (VPC + Subnets)
# ------------------------

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sailraceiq-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sailraceiq-public-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "sailraceiq-public-b"
  }
}

# ------------------------
# Internet Gateway + Route Table
# ------------------------

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "sailraceiq-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "sailraceiq-public-rt"
  }
}

# Associate the route table with each public subnet
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

# ------------------------
# Security Group
# ------------------------

resource "aws_security_group" "rds_sg" {
  name        = "sailraceiq-db-sg"
  description = "Allow Postgres access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sailraceiq-db-sg"
  }
}

# ------------------------
# RDS PostgreSQL Instance
# ------------------------

resource "aws_db_subnet_group" "main" {
  name       = "sailraceiq-db-subnet-group"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]

  tags = {
    Name = "sailraceiq-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier        = "sailraceiq-db"
  engine            = "postgres"
  engine_version    = "16.6"
  instance_class    = "db.t3.micro"   # Free tier eligible
  allocated_storage = 20
  username          = "postgres"
  password          = "password"
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Name = "sailraceiq-db"
  }
}
