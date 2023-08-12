resource "aws_security_group" "allow_tls" {
  name        = var.security_groups["name"]
  description = var.security_groups["description"]
  vpc_id      = var.security_groups["vpc_id"]

  ingress {
    description      = var.security_groups.http_inbound["description"]
    from_port        = var.security_groups.http_inbound["from_port"]
    to_port          = var.security_groups.http_inbound["to_port"]
    protocol         = var.security_groups.http_inbound["protocol"]
    cidr_blocks      = var.security_groups.http_inbound["cidr_blocks"]
    ipv6_cidr_blocks = var.security_groups.http_inbound["ipv6_cidr_blocks"]
  }

   ingress {
    description      = var.security_groups.https_inbound["description"]
    from_port        = var.security_groups.https_inbound["from_port"]
    to_port          = var.security_groups.https_inbound["to_port"]
    protocol         = var.security_groups.https_inbound["protocol"]
    cidr_blocks      = var.security_groups.https_inbound["cidr_blocks"]
    ipv6_cidr_blocks = var.security_groups.https_inbound["ipv6_cidr_blocks"]
  }

  egress {
    from_port        = var.security_groups.outbound["from_port"]
    to_port          = var.security_groups.outbound["to_port"]
    protocol         = var.security_groups.outbound["protocol"]
    cidr_blocks      = var.security_groups.outbound["cidr_blocks"]
    ipv6_cidr_blocks = var.security_groups.outbound["ipv6_cidr_blocks"]
  }

  tags = {
    Name = var.security_groups.tags["name"]
  }
}

resource "aws_instance" "test" {
  ami           = var.server["ami"]
  instance_type = var.server["instance_type"]
  key_name = var.server["key_name"]
  security_groups = var.server["security_group_id"]

  tags = {
    Name = var.server.tags["name"]
    Account=var.server.tags["account"]

  }
}

