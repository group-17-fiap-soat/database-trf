data "aws_subnet" "public_1" {
  filter {
    name   = "tag:Name"
    values = ["fastfood-public-1"]
  }
}

data "aws_subnet" "public_2" {
  filter {
    name   = "tag:Name"
    values = ["fastfood-public-2"]
  }
}
