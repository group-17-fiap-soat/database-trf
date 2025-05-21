resource "aws_security_group" "sg_postgres" {
  name        = "SG-postgres"
  description = "Permite acesso ao PostgreSQL (porta 5432)"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-postgres"
  }
}