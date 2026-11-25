locals {
  ami_id            = data.aws_ami.join_devops.id
  public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  bastion_sg_id     = data.aws_ssm_parameter.bastion_sg_id.value

  comman_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = true
    Name        = "${var.project}-${var.environment}-bastion"

  }

}


# split(",", var.my_string)
