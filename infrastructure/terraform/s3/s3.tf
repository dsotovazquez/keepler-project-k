resource "aws_s3_bucket" "kp_logs_bucket" {

  bucket        = var.kp_logs_bucket_name
  acl           = "private"
  force_destroy = "true"
  versioning {
    enabled = var.kp_logs_bucket_versioning_enabled
  }
  tags = local.tags

  server_side_encryption_configuration {
    rule {
      bucket_key_enabled = true
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.kp_s3_custom_kms_key.arn
        sse_algorithm     = "aws:kms"
     }
    }
  }

  #lifecycle_rule {
  #  id      = "kp_logs_bucket-objects-purge : TODO-EXPLANATION"
  #  enabled = var.kp_logs_bucket_objects_lifecycle_enabled
  #  abort_incomplete_multipart_upload_days = 0
  #  prefix  = var.kp_logs_bucket_objects_lifecycle_prefix
  #  tags    = {
  #            "deleted" = "true"
  #            }
  #
  #   expiration {
  #        days                         = var.kp_logs_bucket_retention_days
  #         expired_object_delete_marker = false
  #            }
  #}
}

resource "aws_s3_bucket" "kp_transformation_logs_bucket" {

  bucket        = var.kp_transformation_logs_bucket_name
  acl           = "private"
  force_destroy = "true"
  versioning {
    enabled = var.kp_transformation_logs_bucket_versioning_enabled
  }
  tags = local.tags

  server_side_encryption_configuration {
    rule {
      bucket_key_enabled = true
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.kp_s3_custom_kms_key.arn
        sse_algorithm     = "aws:kms"
     }
    }
  }

  #lifecycle_rule {
  #  id      = "kp_logs_bucket-objects-purge : TODO-EXPLANATION"
  #  enabled = var.kp_logs_bucket_objects_lifecycle_enabled
  #  abort_incomplete_multipart_upload_days = 0
  #  prefix  = var.kp_logs_bucket_objects_lifecycle_prefix
  #  tags    = {
  #            "deleted" = "true"
  #            }
  #
  #   expiration {
  #        days                         = var.kp_logs_bucket_retention_days
  #         expired_object_delete_marker = false
  #            }
  #}
}
