#output "public_ip" {
#  value = "${aws_instance.example.public_ip}"
#}

#output "public_ip" {
#  value = "$(var_server_port}"
#}

#output "elb_dns_name" {
# value = "$aws_elb.exelb.dns_name}"
#}

#output "server_name" {
#  value = "${aws_instance.example.tags.Name}"
#}

output "state_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}
