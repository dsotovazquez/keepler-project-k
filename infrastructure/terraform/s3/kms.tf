resource "aws_kms_key" "kp_s3_custom_kms_key" {

  description = "Custom KMS key for the S3 buckets encryption"
  key_usage = "ENCRYPT_DECRYPT"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  #deletion_window_in_days = 10
  is_enabled = true
  enable_key_rotation = false
  tags = local.tags

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "s3-kms-access-policy"
    Statement = [
      {
        Sid       = "Enable IAM User Permissions"
        Effect    = "Allow"
        Principal = {
              AWS = "arn:aws:iam::${var.account}:root"
        }
        Action    = ["kms:*"]
        Resource = [
          "*"
        ]
      },
      {
        Sid       = "Allow the use of this key"
        Effect    = "Allow"
        Principal = {
            AWS = [
                   "arn:aws:iam::${var.account}:root"
                  ]
        }
        Action    = ["kms:Encrypt", "kms:Decrypt", "kms:ReEncrypt*", "kms:GenerateDataKey*", "kms:DescribeKey"]
        Resource = [
          "*"

        ]
       }
    ]
  })
}


resource "aws_kms_alias" "kp_s3_custom_kms_key_alias" {
   name          =  var.kp_s3_custom_kms_key_alias
   target_key_id = aws_kms_key.kp_s3_custom_kms_key.key_id
}
