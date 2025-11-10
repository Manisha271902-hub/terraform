resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.terraform
  zone_id = "${var.zone_id}"
  name    =  "${each.key}.${var.domain_name}"   #"${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [each.value.private_ip] #[aws_instance.terraform[count.index].private_ip]
}