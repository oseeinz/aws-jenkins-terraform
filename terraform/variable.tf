#set default region
#variable "aws_region" {
#  default = "us-east-1"
#}
#Custom AMI to be used to launch instance
#variable "ami" {
#  default = "ami-0fa09f8066ae75f1a"
#}

variable "instance_type" {
  default = "t2.micro"
}

#pem key pair name only to be used to launch and SSH into the instance
variable "key_name" {
  default = "home_key"
}
#variable "environment" {
#  description = "Environment tag"
#  default = "test"
#}
