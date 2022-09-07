resource "aws_ecs_task_definition" "ecs_task" {
  family = var.ecs_task_family
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = var.execution_role_arn

  cpu = var.container_cpu
  memory = var.container_memory

  container_definitions = jsonencode([{
    name = "${var.container_name}",
    image = "${var.ecr_repo_uri}:1",

    portMappings = [{
      protocol      = "tcp"
      containerPort = var.container_port
    }]
  }])

  tags = {
    Name = var.ecs_task_family
  }
}
