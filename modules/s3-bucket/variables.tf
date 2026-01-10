# modules/s3-bucket/variables.tf
# Input variables for the S3 bucket module

variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  
  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be 3-63 characters, lowercase, and DNS-compliant."
  }
}

variable "environment" {
  description = "The deployment environment (dev, staging, prod)."
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to the bucket."
  type        = map(string)
  default     = {}
}