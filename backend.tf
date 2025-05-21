terraform {
  backend "s3" {
    bucket = "terraform-pipeline-bucket-361598269712"
    key    = "rds/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
