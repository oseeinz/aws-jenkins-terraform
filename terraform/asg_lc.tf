resource "aws_launch_configuration" "TFwebbapp_lc" {
  name_prefix          = "TFwebbapp_lc-"
  image_id             = "${data.aws_ami.webapp_ami.id}"
  instance_type        = "${var.instance_type}"
  key_name             = "${var.key_name}"
  security_groups      = ["${aws_security_group.TF_sg.id}"]
  associate_public_ip_address = true
  enable_monitoring    = false

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "TF_asg" {
  name                  = "TFwebapp-asg"
  vpc_zone_identifier   = ["${aws_subnet.TFsub_pub.id}", "${aws_subnet.TFsub_pub2.id}"]
  launch_configuration  = "${aws_launch_configuration.TFwebbapp_lc.name}"
  min_size              = 2
  max_size              = 2
  load_balancers        = ["${aws_elb.TFweb-elb.name}"]
  health_check_type     = "ELB"
  #force_delete          = true

  tag {
    key                 = "Name"
    value               = "TF-apache-webapp"
    propagate_at_launch = true
  }
}
