terraform{
  backend "s3" {}
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_vpc" "current_vpc" {
  filter {
    name   = "tag:Name"
    values = [ var.vpc_name ]
  }
}

