resource "aws_lb" "test" {
  name               = "${var.prefix}-lb-tf"
  internal           = false
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  subnets            = [for subnet in var.subnet_id : subnet]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip-example.arn
  }
}

resource "aws_lb_target_group" "ip-example" {
  name        = "${var.prefix}-lb-tg"
  port        = 80
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  count = length(var.target_id)
  target_group_arn = aws_lb_target_group.ip-example.arn
  target_id        = var.target_id[count.index]
  port             = 8080
}




