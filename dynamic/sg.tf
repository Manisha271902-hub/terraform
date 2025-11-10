

resource "aws_security_group" "my-sg_roboshop" {
  name        = "strict_sg_roboshop"
  description = "Allow only specific traffic"

  
  egress {
    from_port       = 0 #all pprts
    to_port         = 0
    protocol        = "-1" #all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  #block
  dynamic "ingress" {  # ddynamic block ki petina keyword eh terrafom isatdi
    for_each = toset(var.ingress_ports)

    content {
        from_port       = ingress.value # here ingress is a special key word
        to_port         = ingress.value
        protocol        = "tcp"  # idhi all ports ni open chesinapude -1 istam ikada"-1" #all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  # ingress {
  #   from_port       = 3306 #all pprts
  #   to_port         = 3306
  #   protocol        = "-1" #all protocols
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port       = 8080 #all pprts
  #   to_port         = 8080
  #   protocol        = "-1" #all protocols
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }
  tags = {
    Name = "allow_all"
    Terraform = true
  }
}

