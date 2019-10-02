resource "aws_security_group" "instance" {
   name = "${var.cluster_name}-instance"

   ingress {
      from_port = "${var.server_port}"
      to_port   = "${var.server_port}"
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }
  

  lifecycle {
    create_before_destroy = true
  }
}
