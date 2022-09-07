#VPC
variable "vpc_id" {}

#Public subnet CIDRs
variable "pub_cidr_id_a" {}

variable "pub_cidr_id_b" {}

variable "pub_cidr_id_c" {}

#LB values 
variable "lb_name" {}

variable "lb_tg_name" {}

variable "lb_sg_id" {}

#Container
variable "container_port" {}
