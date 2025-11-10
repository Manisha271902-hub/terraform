resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.my-sg.id] #attribute reference -refer in documentation- ivi ee resource ki i.e sg 
  #manaki output ga istadi
  tags = var.ec2_tags
}

resource "aws_security_group" "my-sg" {
  name        = var.sg_name
  description = "Allow all Traffic"

  
  egress {
    from_port       = var.egress_from_port #all pprts
    to_port         = var.egress_to_port
    protocol        = var.protocol #all protocols
    cidr_blocks      = var.cidr
  }

  
  ingress {
    from_port       = var.ingress_from_port #all pprts
    to_port         = var.ingress_to_port
    protocol        = var.protocol #all protocols
    cidr_blocks      = var.cidr
  }

  tags = {
    Name = "allow_all"
    Terraform = true
  }
}

