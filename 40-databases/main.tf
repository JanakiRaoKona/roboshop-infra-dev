### mongodb ### 
resource "aws_instance" "mongodb" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.database_subnet_ids
  vpc_security_group_ids = [local.mongodb_sg_id]
  tags = merge(
    local.comman_tags,
    { Name = "${var.project}-${var.environment}-mongodb" }
  )

}
resource "terraform_data" "mongodb" {
  # Re-run whenever the instance changes
  triggers_replace = [
    aws_instance.mongodb.id
  ]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
    ]
  }
}

### Redis ### 
resource "aws_instance" "redis" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.database_subnet_ids
  vpc_security_group_ids = [local.redis_sg_id]
  tags = merge(
    local.comman_tags,
    { Name = "${var.project}-${var.environment}-redis" }
  )

}
resource "terraform_data" "redis" {
  # Re-run whenever the instance changes
  triggers_replace = [
    aws_instance.redis.id
  ]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.redis.private_ip
  }
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh redis ${var.environment}"
    ]
  }
}

### MYSQL ### 
resource "aws_instance" "mysql" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.database_subnet_ids
  vpc_security_group_ids = [local.mysql_sg_id]
  iam_instance_profile   = aws_iam_instance_profile.mysql.name
  tags = merge(
    local.comman_tags,
    { Name = "${var.project}-${var.environment}-mysql" }
  )

}
resource "terraform_data" "mysql" {
  # Re-run whenever the instance changes
  triggers_replace = [
    aws_instance.mysql.id
  ]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mysql.private_ip
  }
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mysql ${var.environment}"
    ]
  }
}

### rabbitmq ### 
resource "aws_instance" "rabbitmq" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.database_subnet_ids
  vpc_security_group_ids = [local.rabbitmq_sg_id]
  iam_instance_profile   = aws_iam_instance_profile.rabbitmq.name
  tags = merge(
    local.comman_tags,
    { Name = "${var.project}-${var.environment}-rabbitmq" }
  )

}
resource "terraform_data" "rabbitmq" {
  # Re-run whenever the instance changes
  triggers_replace = [
    aws_instance.rabbitmq.id
  ]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.rabbitmq.private_ip
  }
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh rabbitmq ${var.environment}"
    ]
  }
}
