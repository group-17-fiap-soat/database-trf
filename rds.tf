locals {
  subnet_id_map_public_only = {
    public-1 = data.aws_subnet.public_1.id
    public-2 = data.aws_subnet.public_2.id
  }
}

resource "aws_db_subnet_group" "rds_subnets" {
  name       = "fastfood-rds-subnet-public-group"
  subnet_ids = values(local.subnet_id_map_public_only)

  tags = {
    Name = "fastfood-rds-subnet-public-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "fastfood-db"
  engine                 = "postgres"
  engine_version         = "16.6"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_user
  password               = var.db_password
  port                   = 5432
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.sg_postgres.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name
  skip_final_snapshot    = true

  tags = {
    Name = "fastfood-postgres"
  }
}
