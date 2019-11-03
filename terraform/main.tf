# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-bucket-ose"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
#  access_key = "${var.aws_access_key}"
#  secret_key = "${var.aws_secret_key}"
  region  = "${var.aws_region}"
}
