resource "aws_instance" "frontend" {
  ami             = var.ami_id
  instance_type   = "t3.micro"
  key_name        = var.key_name
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.frontend_sg.id]
}

