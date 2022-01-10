environment          = "prd"
owner                = "kp"
region               = "eu-west-1"
account              = "611144594304"
vpc_id		     = "vpc-07e74339341b07c48"
vpc_name	     = "vpc-awsconfig"

common_tags = {
    "Owner" : "kp",
    "Environment" : "prd",
}

kp_logs_bucket_name 		                           = "kp-ingestion-logs-prd"
kp_transformation_logs_bucket_name          		   = "kp-transformation-logs-prd"

kp_s3_aws_kms_key_id                            = "1507d105-dcd5-4e1c-b03d-6dbd3b85d728"
kp_logs_processor_lambda_security_group_name    = "kp-rss-ingestion-lambda-security-group"
kp_logs_processor_lambda_role_name              = "kp-rss-ingestion-lambda-role-prd"
kp_step_function_name				= "kp-log-processing"

kp_logs_processor_function_name		= "kp-logs-processor"
kp_logs_processor_handler		= "kp-logs-processor.lambda_handler"
kp_logs_processor_runtime		= "python3.8"
kp_logs_processor_timeout		= "300"
kp_logs_processor_package_type		= "Zip"
kp_logs_processor_memory			= "128"
kp_logs_processor_description	        = "Keepler Logs Processor Lambda Function"
kp_logs_processor_alias_name	        = "kp-logs-processor"
kp_logs_processor_alias_description	= "Keepler Logs Processor Lambda Function"
