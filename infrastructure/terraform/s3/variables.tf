variable "environment" {}
variable "owner" {}
variable "region" {}
variable "account" {}

variable "kp_logs_bucket_name" {
  type = string
  description = "Keepler logs S3 Bucket Name"
  default = ""
}

variable "kp_logs_bucket_versioning_enabled" {
  type = bool
  description = "Specifies if the versioning is enabled in the Keepler logs S3 Bucket"
  default = false
}

variable "kp_logs_bucket_retention_days" {
  type = number
  description = "lifecycle Retention Days for the logs S3 Bucket Objects"
  default = 15
}

variable "kp_s3_custom_kms_key_alias" {
  type = string
  description = "S3 Keepler project KMS alias"
}

variable "kp_transformation_logs_bucket_name" {
  type = string
  description = "Keepler transformation logs S3 Bucket Name"
  default = ""
}

variable "kp_transformation_logs_bucket_versioning_enabled" {
  type = bool
  description = "Specifies if the versioning is enabled in the Keepler logs S3 Bucket"
  default = false
}

