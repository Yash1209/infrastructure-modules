# S3 Bucket Module

Creates a secure S3 bucket with encryption and versioning.

## Usage

module "my_bucket" {
  source  = "spacelift.io/YOUR-ACCOUNT/s3-bucket/aws"
  version = "1.0.0"

  bucket_name = "my-application-data"
  environment = "prod"
}

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| bucket_name | The S3 bucket name | string | n/a | yes |
| environment | Deployment environment | string | "dev" | no |
| enable_versioning | Enable bucket versioning | bool | true | no |
| tags | Additional tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The bucket name |
| bucket_arn | The bucket ARN |