variable "instance_type"{
  type    = string
  default = "t2.micro"
}

variable "env_prefix"{
  type    = string
  }

variable "ingress_ports"{
  type    = list(number)
  default = [22,8090]
  }
