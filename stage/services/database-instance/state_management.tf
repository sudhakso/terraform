terraform {
 backend "s3" {
   bucket = "terraform-state-learn"
   key    = "global/s3/stage/db-instance-terraform.tfstate"
   region = "us-east-1"
 }

}


resource "aws_s3_bucket" "db-instance-terraform_state" {

    bucket = "terraform-state-learn"
    versioning {
       enabled = true
    }

    lifecycle {
      prevent_destroy = false
    }

}
