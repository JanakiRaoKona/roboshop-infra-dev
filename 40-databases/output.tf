output "mysql_root_password" {
  value = data.aws_ssm_parameter.mysql_root_password.value
}
