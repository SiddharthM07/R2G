resource "aws_s3_bucket" "devops" {
    bucket = var.bucket_name
    acl = "private"

    versioning {
      enabled = true
    }
  
}

