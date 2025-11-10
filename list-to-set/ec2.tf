resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  for_each = toset(var.instance_names)
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my-sg.id] #attribute reference -refer in documentation- ivi ee resource ki i.e sg 
  #manaki output ga istadi
  tags = {
    Name = "terraform"
    Terraform = true
  }
}

resource "aws_security_group" "my-sg" {
  name        = "allow_all"
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

  tags = {
    Name = "allow_all"
    Terraform = true
  }
}

