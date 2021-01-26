terraform {
  backend "s3" {}
}

provider "aws" {}

module "website" {
  source         = "./modules/S3"
  s3_bucket_name = "ldz-rtg-takehome-gatsby"
}