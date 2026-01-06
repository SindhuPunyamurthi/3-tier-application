resource "aws_db_subnet_group" "main" {
  name = "student-db-subnet-group"

  subnet_ids = [
    aws_subnet.db_subnet_1.id,
    aws_subnet.db_subnet_2.id
  ]
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "studentdb"
  username             = "admin"
  password             = var.db_password
  publicly_accessible  = false
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.main.name
}
