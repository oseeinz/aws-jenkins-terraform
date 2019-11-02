data "aws_ami" "webapp_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-image*"]
  }
  owners = ["self"]
}
