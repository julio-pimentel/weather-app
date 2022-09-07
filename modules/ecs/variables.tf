#Private subnets
variable "priv_cidr_id_a" {}

variable "priv_cidr_id_b" {}

#Public subnets
variable "pub_cidr_id_a" {}

variable "pub_cidr_id_b" {}

#LB Target group
variable "lb_tg_arn" {}

#ECS role 
variable "execution_role_arn" {}

#ECS values 
variable "ecs_cluster_name" {}

variable "ecs_service_name" {}

variable "ecs_tasks_sg_id" {}

variable "ecs_task_family" {}

#ECR repo 
variable "ecr_repository_url" {}

#Container values 
variable "container_port" {}

variable "container_cpu" {}

variable "container_memory" {}

variable "container_name" {}