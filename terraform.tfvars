
security_groups = {
    "name" = "Web_server_SG"
    "description" = "Allow HTTP and HTTPS inbound traffic"
    "vpc_id"      = "vpc-0d22b90c613b60042"
    http_inbound = {
        description      = "Inbound Rule For HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    https_inbound = {
        description      = "Inbound Rule For HTTPS"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    outbound = {
           from_port        = 0
           to_port          = 0
           protocol         = "-1"
           cidr_blocks      = ["0.0.0.0/0"]
           ipv6_cidr_blocks = ["::/0"]
    }
   
   tags = {
     name = "allow_Traffic"
  }

}


server = {
"name" =  "Terraform-Server"
"ami"           = "ami-0343ac03b28f230a0"
"instance_type" = "t2.micro"
"key_name" = "ec2-accesskey"
"security_group_id" = ["Web_server_SG"]
tags={
    "name"="Hello"
    "account"="aws"
    
 }
}

