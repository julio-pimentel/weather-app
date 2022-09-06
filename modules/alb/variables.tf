#VPC
variable "vpc_id" {
  type = string
}

#Public subnet CIDRs
variable "pub_cidr_id_1" {
  type = string
}

variable "pub_cidr_id_2" {
  type = string
}

variable "pub_cidr_id_3" {
  type = string
}

#ALB values 
variable "alb_name" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

variable "alb_tg_name" {
  type = string
}

#Container
variable "container_port" {

}
