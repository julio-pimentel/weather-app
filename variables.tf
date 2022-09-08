#VPC 
data "aws_ssm_parameter" "vpc_id" {
  description = "VPC ID from Parameter Store"
  name  = "/${var.ssm_prefix}/infra/vpc/vpc_id"
}

#Private subnet
data "aws_ssm_parameter" "priv_cidr_id_a" {
  description = "Private subnet A ID from Parameter Store"
  name  = "/${var.ssm_prefix}/infra/vpc/priv_cidr_id_a"
}

data "aws_ssm_parameter" "priv_cidr_id_b" {
  description = "Private subnet B ID from Parameter Store"
  name  = "/${var.ssm_prefix}/infra/vpc/priv_cidr_id_b"
}

data "aws_ssm_parameter" "priv_cidr_id_c" {
  description = "Private subnet C ID from Parameter Store"
  name  = "/${var.ssm_prefix}/infra/vpc/priv_cidr_id_c"
}

#Public subnet
data "aws_ssm_parameter" "pub_cidr_id_a" {
  description = "Public subnet A ID from Parameter Store"
  name  = "/${var.ssm_prefix}/infra/vpc/pub_cidr_id_a"
}

data "aws_ssm_parameter" "pub_cidr_id_b" {
  description = "Public subnet B ID from Parameter Store"
  name  = "/${var.ssm_prefix}/infra/vpc/pub_cidr_id_b"
}

data "aws_ssm_parameter" "pub_cidr_id_c" {
  description = "Public subnet C ID from Parameter Store"
  name  = "/${var.ssm_prefix}/infra/vpc/pub_cidr_id_c"
}

# Region and AZs 
variable "aws_region" {
  description = "Region where the project will be deployed"
  type = string 
  default = "us-east-1"
}

#ALB
variable "lb_name" {
  description = "Load Balancer name"
  type = string
  default = "weather-app-pimentel-lb"
}

variable "lb_tg_name" {
  description = "Load Balancer Target Group name"
  type = string
  default = "weather-app-pimentel-lb-tg"
}

#Security groups
data "aws_ssm_parameter" "lb_sg_id" {
  description = "Security group for LB ID from Parameter Store"
  name  = "/${var.ssm_prefix}/sg/lb_sg_id"
}

data "aws_ssm_parameter" "ecs_tasks_sg_id" {
  description = "Security group for ECS Task ID from Parameter Store"
  name  = "/${var.ssm_prefix}/sg/ecs_tasks_sg_id"
}

#ECS
variable "ecs_task_family" {
  description = "ECS Task Family name"
  type = string
  default = "weather-app-pimentel-fam"
}

data "aws_ssm_parameter" "ecs_task_execution_role_arn"{
  description = "ECS Task Execution Role ARN from Parameter Store"
  name  = "/${var.ssm_prefix}/ecr/ecs_task_execution_role_arn"
}

variable "ecs_cluster_name" {
  description = "ECS Task Execution Role ARN from Parameter Store"
  type = string
  default = "weather-app-cluster-pimentel"
}

variable "ecs_service_name" {
  description = "ECS Service name"
  type = string
  default = "weather-app-service-pimentel"
}

#ECR
data "aws_ssm_parameter" "ecr_repository_url" {
  description = "ECR Repository URL from Parameter Store"
  name  = "/${var.ssm_prefix}/ecr/ecr_repository_url"
}

#Docker container 
variable "container_port" {
  description = "Container port"
  type = number
  default = 3000
}

variable "container_cpu" {
  description = "Container CPU"
  type = string
  default = "256"
}

variable "container_memory" {
  description = "Container memory"
  type = string
  default = "512"
}

variable "container_name" {
  description = "Container name"
  type = string
  default = "weather-app"
}

# SSM parameter store 
variable "ssm_prefix" {
  description = "Prefix for SSM Parameter Store"
  type = string
  default = "weather-app-pimentel"
}
