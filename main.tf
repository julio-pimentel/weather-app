module "s3_bucket" {
  source = "./modules/s3"
  bucket = var.bucket

  tags = var.tags
}

module "alb" {
  source = "./modules/alb"

  vpc_id = var.vpc_id
  pub_cidr_id_1 = var.pub_cidr_id_1
  pub_cidr_id_2 = var.pub_cidr_id_2
  pub_cidr_id_3 = var.pub_cidr_id_3

  alb_name = var.alb_name
  alb_tg_name = var.alb_tg_name
  alb_sg_id = var.alb_sg_id
  container_port = var.container_port
}

module "ecs" {
  source  = "./modules/ecs"

  pub_cidr_id_1 = var.pub_cidr_id_1
  pub_cidr_id_2 = var.pub_cidr_id_2

  priv_cidr_id_1 = var.priv_cidr_id_1
  priv_cidr_id_2 = var.priv_cidr_id_2

  alb_tg_arn = module.alb.alb_tg_arn
  execution_role_arn = var.execution_role_arn
  ecr_repo_uri = var.ecr_repo_uri

  ecs_cluster_name = var.ecs_cluster_name
  ecs_service_name = var.ecs_service_name
  ecs_tasks_sg = var.ecs_tasks_sg_id
  ecs_task_family = var.ecs_task_family
  container_port = var.container_port
  container_cpu = var.container_cpu
  container_memory = var.container_memory
  container_name = var.container_name
}