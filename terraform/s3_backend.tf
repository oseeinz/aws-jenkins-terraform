# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-bucket-ose"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
