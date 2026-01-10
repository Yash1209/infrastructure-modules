# modules/s3-bucket/main.tf
# Main resource definitions for S3 bucket module

locals {
  common_tags = merge(
    {
      Environment = var.environment
      ManagedBy   = "OpenTofu"
      Module      = "s3-bucket"
    },
    var.tags
  )
}

# Primary S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = local.common_tags
}

# Bucket Versioning Configuration
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
  }
}

# Block All Public Access (Security Best Practice)
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Server-Side Encryption Configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}