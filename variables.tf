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
  default = "subnet-0e438071567f0aa7b"
}

#ALB
variable "alb_name" {
  type = string
  default = "weather-app-pimentel-alb"
}

#Security groups
variable "alb_sg_id" {
  type = string
  default = "sg-076b7dfb1a5d47ae4"
}

variable "ecs_tasks_sg_id" {
  type = string
  default = "sg-088dc32f4062299ec"
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


