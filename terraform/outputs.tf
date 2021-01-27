output "gatsby_website_endpoint" {
  value = "http://${aws_s3_bucket.gatsby_bucket.website_endpoint}"
}