provider "aws" {
   region = "us-east-1"
}

#resource aws_instance "example" {
#  ami 		= "ami-40d28157"
#  instance_type = "t2.micro"
#  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
#  user_data	= "${data.template_file.user_data.rendered}" 

#  tags = {
#    Name = "terraform_example"
#  }
  
#  lifecycle {
#    create_before_destroy = true
#  }
#}


#resource aws_launch_configuration "example" {
#  image_id 		= "ami-40d28157"
#  instance_type = "t2.micro"
#  security_groups = ["${aws_security_group.instance.id}"]
#  user_data	= "${data.template_file.user_data.rendered}" 
  
#  lifecycle {
#    create_before_destroy = true
# }
#}

## Using modules

module "web-cluster" {
 source = "/Users/sonu/work/learn/tf/modules/services/web-cluster"

 cluster_name 		= "webserver-stage"
 db_remote_state_bucket = "terraform-state-learn" 
 db_remote_state_key 	= "global/s3/stage/db-instance-terraform.tfstate"
}
