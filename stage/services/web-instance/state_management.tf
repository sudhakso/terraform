terraform {
 backend "s3" {
   bucket = "terraform-state-learn"
   key    = "global/s3/stage/terraform.tfstate"
   region = "us-east-1"
 }

}

resource "aws_s3_bucket" "terraform_state" {

    bucket = "terraform-state-learn"
    versioning {
       enabled = true
    }

    lifecycle {
      prevent_destroy = false
    }

}
