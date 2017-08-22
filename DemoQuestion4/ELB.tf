resource "aws_elb" "Koijam-elb" {
  name = "Koijam-elb"
  subnets = ["${aws_subnet.pubsub-1.id}", "${aws_subnet.pubsub-2.id}"]
  security_groups = ["${aws_security_group.Koijam-SG.id}"]
  instances = ["${aws_instance.Koijam-Instance.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "Koijam-elb"
  }
}
