
variable "instance_names"{

    default = {
      mongodb = "t3.micro",
      redis = "t3.micro"
    }
}


variable "zone_id" {
    default = "Z05352003RERPR8A8BZK2"
  
}

variable "domain_name" {
  default = "manisha.sbs"
}
