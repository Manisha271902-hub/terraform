resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my-sg.id] #attribute reference -refer in documentation- ivi ee resource ki i.e sg 
  #manaki output ga istadi
  tags = {
    Name = "terraform"
    Terraform = true
  }
  

  provisioner "local-exec" {
    
    # command = "echo Instance created"
    command = "echo ${self.private_ip} > inventory"
  }
  

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy-time provisioner'"
  }

   #we can add connection block in resource block or provisioner {
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
      inline = [ 
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
       ]
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

