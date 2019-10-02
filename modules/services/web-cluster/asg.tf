
data "aws_availability_zones" "azs" {}


resource "aws_autoscaling_group" "example" {
  launch_configuration = "${aws_launch_configuration.example.id}"
  availability_zones   = "${data.aws_availability_zones.azs.names}"
  
  load_balancers = ["{aws_elb.exelb.name}"]
  health_check_type = "ELB"

  min_size = 2
  max_size = 5

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-asg"
    propagate_at_launch = true
  }
}

resource "aws_elb" "exelb" {
  name               = "${var.cluster_name}-elb"
  availability_zones = "${data.aws_availability_zones.azs.names}"
  security_groups    = ["${aws_security_group.elb.id}"]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "${var.server_port}"
    instance_protocol = "http"
  }
}

resource "aws_security_group" "elb" {
  name = "${var.cluster_name}-sg-elb"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
