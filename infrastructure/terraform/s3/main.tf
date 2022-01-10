terraform{
  backend "s3" {}
}

locals {
  tags = {
    Owner                = var.owner
    Environment          = var.environment
  }
}
