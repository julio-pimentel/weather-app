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
  default = "vpc-0e238da83f0d928f6"
}


#Public subnets
variable "pub_cidr_id_1" {
  default = "subnet-04afe9c2b6fa1ee93"
}

variable "pub_cidr_id_2" {
  default = "subnet-0c481b787b399df51"
}

variable "pub_cidr_id_3" {
  default = "subnet-0dc3d3632742237f5"
}

#Private subnets
variable "priv_cidr_id_1" {
  default = "subnet-09b4a12c843a6de60"
}

variable "priv_cidr_id_2" {
  default = "subnet-0938cfd27acbe10ab"
}

variable "priv_cidr_id_3" {
  default = "subnet-06fb9d2b1c7999815"
}

#Security groups
variable "alb_sg_id" {
  type = string
  default = "sg-064e9fd7c459db204"
}

variable "ecs_tasks_sg_id" {
  type = string
  default = "sg-08dbf103e44d499ed"
}

#ALB
variable "alb_name" {
  type = string
  default = "weather-app-pimentel-alb"
}

variable "alb_tg_name" {
  type = string
  default = "alb-tg-weather-pimentel"
}

#ECS
variable "ecs_task_family" {
  type = string
  default = "weather-app-fam-pimentel"
}

variable "execution_role_arn" {
  type = string
  default = "arn:aws:iam::152848913167:role/julio-pimentel-EcsExecutionRole"
}

variable "ecs_cluster_name" {
  type = string
  default = "weather-app-cluster-pimentel"
}

variable "ecs_service_name" {
  type = string
  default = "weather-app-service-pimentel"
}

#Docker container 
variable "container_name" {
  type = string
  default = "weather-app"
}

variable "container_cpu" {
  type = string
  default = "256"
}

variable "container_memory" {
  type = string
  default = "512"
}

variable "container_port" {
  default = 3000
}

#ECR
variable "ecr_repo_uri" {
  type = string
  default = "152848913167.dkr.ecr.us-east-1.amazonaws.com/julio-pimentel-node-weather-app"
}


