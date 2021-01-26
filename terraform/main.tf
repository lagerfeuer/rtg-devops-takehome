terraform {
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}

module "website" {
  source         = "./modules/S3"
  s3_bucket_name = "ldz-rtg-takehome-gatsby"
}