variable "zone_id" {
    default = "Z05352003RERPR8A8BZK2"
  
}

variable "domain_name" {
  default = "manisha.sbs"
}

variable "instance_names"{

    type=list 
    default = ["mongodb", "redis", "mysql", "rabbitmq"]
}