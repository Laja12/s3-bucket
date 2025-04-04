provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "s3_bucket_1" {
  bucket = "s3_bucket_1"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "sample_file" {
  bucket = aws_s3_bucket.s3_bucket_1.bucket
  key    = "bucket.txt"
  source = "bucket.txt"
}

output "bucket_name" {
  value = aws_s3_bucket.s3_bucket_1.bucket
}
