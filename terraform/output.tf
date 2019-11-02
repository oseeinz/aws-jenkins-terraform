#output "instance_ips" {
#  value = ["${aws_instance.TF_web.*.public_ip}"]
#}

output "elb_dns" {
  description = "This is the DNS name of TFwebapp load balancer"
  value       = "${aws_elb.TFweb-elb.dns_name}"
}
