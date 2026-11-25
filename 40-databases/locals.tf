locals {
  ami_id              = data.aws_ami.join_devops.id
  mongodb_sg_id       = data.aws_ssm_parameter.mongodb_sg_id.value
  database_subnet_ids = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]


  comman_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = true
    Name        = "${var.project}-${var.environment}-mongodb"

  }

}


