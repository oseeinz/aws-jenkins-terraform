# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-bucket-ose"
    key    = "terraform/tf.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
#  access_key = "${var.aws_access_key}"
#  secret_key = "${var.aws_secret_key}"
  region  = "${var.aws_region}"
}
#Lauch EC2 with the following resources
#resource "aws_instance" "TF_web" {
#  #ami                    = "${var.ami}"
#  ami                    = "${data.aws_ami.webapp_ami.id}"
#  instance_type          = "${var.instance_type}"
#  key_name               = "${var.key_name}"
#  vpc_security_group_ids = ["${aws_security_group.TF_sg.id}"]
#  subnet_id              = "${aws_subnet.TFsub_pub.id}"
#  associate_public_ip_address = true
#  user_data              = "${file("enable_tomcat.sh")}"
#
#  tags = {
#    "Environment" = "${var.environment}"
#  }
#}
