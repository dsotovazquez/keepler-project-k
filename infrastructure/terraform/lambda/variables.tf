variable "environment" {}
variable "vpc_name" {}
variable "vpc_id" {}
variable "region" {}
variable "account" {}
variable "owner" {}
variable "common_tags" {}

variable "kp_step_function_name" {

  type = string
  description = "Keepler Log Processor Step Function Name"

}

variable "kp_logs_processor_function_name" {

  type = string
  description = "Keepler Log Processor Lambda Function Name"

}

variable "kp_logs_processor_handler" {

  type = string
  description = "Keepler Log Processor Lambda Function Handler"

}

variable "kp_logs_processor_package_type" {

  type = string
  description = "Keepler Log Processor Lambda Function Package Type"

}

variable "kp_logs_processor_runtime" {

  type = string
  description = "Keepler Log Processor Lambda Function Runtime"

}

variable "kp_logs_processor_timeout" {

  type = string
  description = "Keepler Log Processor Lambda Function Timeout"

}

variable "kp_logs_processor_memory" {

  type = string
  description = "Keepler Log Processor Lambda Function Memory"

}

variable "kp_logs_processor_description" {

  type = string
  description = "Keepler Log Processor Lambda Function Description"

}

variable "kp_logs_processor_alias_name" {

  type = string
  description = "Keepler Log Processor Lambda Function Alias Name"

}

variable "kp_logs_processor_alias_description" {

  type = string
  description = "Keepler Log Processor Lambda Function Alias Description"

}

variable "kp_logs_processor_lambda_role_name" {

  type = string
  description = "logs_processor lambda IAM role name"

}


variable "kp_logs_processor_lambda_security_group_name" {

  type = string
  description = "logs_processor lambda security group name"

}

variable "kp_transformation_logs_bucket_name" {

   type = string
   description = "Logs Processed S3 Bucket Name"

}

variable "kp_logs_bucket_name" {

   type = string
   description = "Logs Ingestion S3 Bucket Name"

}


variable "kp_s3_aws_kms_key_id" {

   type = string
   description = "S3 Enviroment KMS Custom Key"

}
