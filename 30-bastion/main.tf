resource "aws_instance" "bastion" {
  ami                         = local.ami_id
  instance_type               = "t3.micro"
  subnet_id                   = local.public_subnet_ids[0]
  vpc_security_group_ids      = [local.bastion_sg_id]
  iam_instance_profile        = aws_iam_instance_profile.bastion.name
  user_data_replace_on_change = true

  # We are going to run terraform commands from this instance , so its need more disk 
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/bastion.sh.tftpl", {
    partition_number = 4
    extra_disk_size  = 20
  })

  tags = local.comman_tags

}
