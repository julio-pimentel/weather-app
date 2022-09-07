resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
  tags = {
    Name = var.ecs_cluster_name
  }
}

resource "aws_ecs_service" "ecs_service" {
  name = var.ecs_service_name
  cluster = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count = 2
  launch_type = "FARGATE"
  scheduling_strategy = "REPLICA"

  network_configuration {
    security_groups  = [var.ecs_tasks_sg_id]
    subnets = [var.priv_cidr_id_a, var.priv_cidr_id_b]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.lb_tg_arn
    container_name   = "${var.container_name}"
    container_port   = var.container_port
  }

/*
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
*/
}