resource "cloudflare_zone" "main" {
  account_id = var.cloudflare_account_id
  zone       = var.domain_name
}

resource "aws_route53_zone" "subdomain" {
  name = "aws.${var.domain_name}"
}

resource "cloudflare_record" "subdomain_ns" {
  count   = 4
  zone_id = cloudflare_zone.main.id
  name    = "aws"
  value   = aws_route53_zone.subdomain.name_servers[count.index]
  type    = "NS"
  ttl     = 3600
}

resource "aws_route53_record" "web_dns" {
  zone_id = aws_route53_zone.subdomain.zone_id
  name    = "web"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web_server.public_ip]
}

resource "aws_route53_record" "app_dns" {
  zone_id = aws_route53_zone.subdomain.zone_id
  name    = "app"
  type    = "A"
  ttl     = 300
  records = [aws_instance.app.private_ip]
}
