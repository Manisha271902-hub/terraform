resource "aws_instance" "terraform" {
  ami           = local.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.my-sg.id] #attribute reference -refer in documentation- ivi ee resource ki i.e sg 
  #manaki output ga istadi
  tags = local.tags
}

resource "aws_security_group" "my-sg" {
  name        = "${local.common_name}--allow-all-sg"
  description = "Allow all Traffic"

  
  egress {
    from_port       = 0 #all pprts
    to_port         = 0
    protocol        = "-1" #all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  
  ingress {
    from_port       = 0 #all pprts
    to_port         = 0
    protocol        = "-1" #all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${local.common_name}--allow-all"
    }

  )
}

