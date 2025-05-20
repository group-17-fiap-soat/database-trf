variable "db_host" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "db_port" {
  default = "5432"
}

variable "vpc_id" {
  description = "ID da VPC onde o RDS será criado"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de Subnet IDs para o RDS"
  type        = list(string)
}
