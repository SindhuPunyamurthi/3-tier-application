resource "aws_launch_template" "tomcat_lt" {
  name_prefix   = "tomcat-lt"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.backend_sg.id]
  }
}

resource "aws_autoscaling_group" "tomcat_asg" {
  desired_capacity = 1
  max_size         = 1
  min_size         = 1

  vpc_zone_identifier = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  launch_template {
    id      = aws_launch_template.tomcat_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]
}

