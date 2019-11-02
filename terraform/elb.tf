# Create AWS webserver LB
resource "aws_elb" "TFweb-elb" {
  name              = "TFweb-appLB"
  subnets           = ["${aws_subnet.TFsub_pub.id}", "${aws_subnet.TFsub_pub2.id}"]
  security_groups   = ["${aws_security_group.TF_elb_sg.id}"]

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:8080/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
  listener {
    lb_port = 8080
    lb_protocol = "http"
    instance_port = "8080"
    instance_protocol = "http"
  }
}

#Add ELB Security group
resource "aws_security_group" "TF_elb_sg" {
  name        = "TF_elb_sg"
  description = "elb security group"
  vpc_id      = "${aws_vpc.TF_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    description = "App server GUI"
    cidr_blocks = ["0.0.0.0/0"]
  }

 egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "TF_sg"
  }
}
