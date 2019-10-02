output "public_ip" {
  value = "$(var_server_port}"
}

output "elb_dns_name" {
 value = "$aws_elb.exelb.dns_name}"
}
