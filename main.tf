module "lb" {
  source = "./modules/lb"

  vpc_id = data.aws_ssm_parameter.vpc_id.value
  pub_cidr_id_a = data.aws_ssm_parameter.pub_cidr_id_a.value
  pub_cidr_id_b = data.aws_ssm_parameter.pub_cidr_id_b.value
  pub_cidr_id_c = data.aws_ssm_parameter.pub_cidr_id_c.value

  lb_name = var.alb_name
  lb_tg_name = var.alb_tg_name
  lb_sg_id = data.aws_ssm_parameter.lb_sg_id.value
  container_port = var.container_port
}

module "ecs" {
  source  = "./modules/ecs"

  pub_cidr_id_a = data.aws_ssm_parameter.pub_cidr_id_a.value
  pub_cidr_id_b = data.aws_ssm_parameter.pub_cidr_id_b.value

  priv_cidr_id_a = data.aws_ssm_parameter.priv_cidr_id_a.value
  priv_cidr_id_b = data.aws_ssm_parameter.priv_cidr_id_b.value

  lb_tg_arn = module.lb.lb_tg_arn
  execution_role_arn = data.aws_ssm_parameter.ecs_task_execution_role_arn.value
  ecr_repository_url = data.aws_ssm_parameter.ecr_repository_url.value

  ecs_cluster_name = var.ecs_cluster_name
  ecs_service_name = var.ecs_service_name
  ecs_tasks_sg_id = data.aws_ssm_parameter.ecs_tasks_sg_id.value
  ecs_task_family = var.ecs_task_family
  container_port = var.container_port
  container_cpu = var.container_cpu
  container_memory = var.container_memory
  container_name = var.container_name
}