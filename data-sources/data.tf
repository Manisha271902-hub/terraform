data "aws_ami" "terraform" {

  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "aws_instance" "mongodb" {
  instance_id = "i-0966be5912882b0bc"

}

#ee owner push chesina images lo unde ee name nak ivamani
#adhi single image manaki iche varak fetch cheyali


output "aws_ami" {   ## this name can be anything
    value = data.aws_ami.terraform.id
  
}

output "mongodb_info" {

    value = data.aws_instance.mongodb.public_ip
}