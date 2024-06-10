resource "aws_lb" "app_alb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public-1.id, aws_subnet.public-2.id] # Use IDs of your public subnets

  enable_deletion_protection = false
}
