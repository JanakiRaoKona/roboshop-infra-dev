resource "aws_route53_record" "mongodb" {
  zone_id         = var.aws_zone_id
  name            = var.mongodb_domain_name
  type            = "A"
  ttl             = 300
  records         = [aws_instance.mongodb.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "redis" {
  zone_id         = var.aws_zone_id
  name            = var.redis_domain_name
  type            = "A"
  ttl             = 1
  records         = [aws_instance.redis.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "mysql" {
  zone_id         = var.aws_zone_id
  name            = var.mysql_domain_name
  type            = "A"
  ttl             = 1
  records         = [aws_instance.mysql.private_ip]
  allow_overwrite = true
}
resource "aws_route53_record" "rabbitmq" {
  zone_id         = var.aws_zone_id
  name            = var.rabbitmq_domain_name
  type            = "A"
  ttl             = 1
  records         = [aws_instance.rabbitmq.private_ip]
  allow_overwrite = true
}
