resource "aws_alb" "lb" {
  name = var.lb_name
  load_balancer_type = "application"
  security_groups = [var.lb_sg_id]
  subnets = [var.pub_cidr_id_a, var.pub_cidr_id_b]

  internal = false
  enable_deletion_protection = false

  tags = {
    Name = var.lb_name
  }
}

resource "aws_alb_target_group" "lb_tg" {
  name = var.lb_tg_name
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "ip"

  tags = {
    Name = var.lb_tg_name
  }
}

resource "aws_alb_listener" "lb_listener" {
  load_balancer_arn = aws_alb.lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.lb_tg.id
  }
}
