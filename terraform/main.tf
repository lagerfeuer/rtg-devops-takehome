provider "aws" {
  region = var.region
}

data "aws_iam_policy_document" "s3_public_read" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.gatsby_bucket.arn}/*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket" "gatsby_bucket" {
  bucket = var.s3_bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "aws_s3_bucket_policy" "gatsby_bucket_policy" {
  bucket = aws_s3_bucket.gatsby_bucket.id
  policy = data.aws_iam_policy_document.s3_public_read.json
}