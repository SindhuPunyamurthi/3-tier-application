resource "aws_instance" "backend" {
  ami             = var.ami_id
  instance_type   = "t3.micro"
  key_name        = var.key_name
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.backend_sg.id]
}

