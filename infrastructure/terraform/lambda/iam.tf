resource "aws_iam_role" "kp_logs_processor_lambda_role" {
  name = var.kp_logs_processor_lambda_role_name
  description = "Keepler logs_processor Lambdas Role"
  path = "/"
  tags = var.common_tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "KeeplerlogsProcessorLambdaRoleAssume"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "kp_logs_processor_lambda_role_policy" {
  name = "LogsProcessorLambdaAccess-${var.environment}"
  description = "Policiy for the Logs Processor Lambda Function"
  path = "/"
  tags = var.common_tags
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowKMSAccess",
        "Effect" : "Allow",
        "Action" : [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"

        ],
        "Resource" : [

           "arn:aws:kms:${var.region}:${var.account}:key/${var.kp_s3_aws_kms_key_id}"

         ]
      },
      {
        "Sid" : "AllowKMSList",
        "Effect" : "Allow",
        "Action" : [
                "kms:DescribeCustomKeyStores",
                "kms:ListKeys",
                "kms:ListAliases"

        ],
        "Resource" : [
                "*"
         ]
      },
      {
        "Sid" : "AllowXRay",
        "Effect" : "Allow",
        "Action" : [
              "xray:PutTraceSegments",
              "xray:PutTelemetryRecords"

        ],
        "Resource" : "*"
      },
      {
        "Sid" : "AllowS3ReadWriteAccess",
        "Effect" : "Allow",
        "Action" : [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:PutObjectAcl",
                "s3:GetObjectTagging"
        ],
        "Resource" : [

               "arn:aws:s3:::${var.kp_logs_bucket_name}",
               "arn:aws:s3:::${var.kp_logs_bucket_name}/*",
               "arn:aws:s3:::${var.kp_transformation_logs_bucket_name}",
               "arn:aws:s3:::${var.kp_transformation_logs_bucket_name}/*"


         ]
      },

      {
        "Sid" : "AllowS3ListAndGetAclsofAllBuckets",
        "Effect" : "Allow",
        "Action" : [
                "s3:ListAllMyBuckets",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation"
        ],
        "Resource" : [
           "arn:aws:s3:::*"
         ]      }
     ]
  })
}

resource "aws_iam_role_policy_attachment" "kp_logs_processor_lambda_role_policy_attachment" {
  role       = aws_iam_role.kp_logs_processor_lambda_role.name
  policy_arn = aws_iam_policy.kp_logs_processor_lambda_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "kp_logs_processor_lambda_role_lambda_basic_execution_policy_attachment" {
  role       = aws_iam_role.kp_logs_processor_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "kp_logs_processor_lambda_role_lambda_vpc_basic_execution_polciy_attachment" {
  role       = aws_iam_role.kp_logs_processor_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}
