#data "terraform_remote_state" "db" {
# backend = "s3"
# config = {
#   bucket = "terraform-state-learn"
#   key    = "global/s3/db-instance-terraform.tfstate"
#   region = "us-east-1"
# }
#}

#data "template_file" "user_data" {
# template = "${file("scripts/user_data.sh")}"
 
# vars = {
#   server_port = "${var.server_port}"
#   db_address  = "${data.terraform_remote_state.db.outputs.address}"
#   db_port     = "${data.terraform_remote_state.db.outputs.port}"
# }
#}


data "terraform_remote_state" "db" {
 backend = "s3"
 config = {
   bucket = "${var.db_remote_state_bucket}"
   key    = "${var.db_remote_state_key}"
   region = "us-east-1"
 }
}

data "template_file" "user_data" {
 template = "${file("scripts/user_data.sh")}"
 
 vars = {
   server_port = "${var.server_port}"
   db_address  = "${data.terraform_remote_state.db.outputs.address}"
   db_port     = "${data.terraform_remote_state.db.outputs.port}"
 }
}
