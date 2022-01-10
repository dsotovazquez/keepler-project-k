resource "aws_security_group" "kp_logs_processor_lambda_security_group" {
  name = "${var.kp_logs_processor_lambda_security_group_name}-${var.environment}"

  description = "Keepler Logs Processor Lambdas Security Group"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

