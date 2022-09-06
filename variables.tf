#S3 bucket
variable "bucket" {
  type        = string
  description = "Specifies the name of an S3 Bucket"
  default     = "weather-app-pimentel-bucket-app"
}

variable "tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default     = {}
}

#VPC 
variable "vpc_id" {
  default = "vpc-0080912e6f08f16c0"
}


#Public subnets
variable "pub_cidr_id_1" {
  default = "subnet-04c80065ce75d366f"
}

variable "pub_cidr_id_2" {
  default = "subnet-04b94ba6fb5168113"
}

variable "pub_cidr_id_3" {
  default = "	subnet-0e438071567f0aa7b"
}



#ALB
variable "alb_name" {
  type = string
  default = "weather-app-pimentel-alb"
}

variable "alb_sg_id" {
  type = string
  default = "weather-app-pimentel-alb-sg"
}

