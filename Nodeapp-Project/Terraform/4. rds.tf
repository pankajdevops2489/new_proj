resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.sub1.id, aws_subnet.sub2.id, aws_subnet.sub3.id, aws_subnet.sub4.id]

  tags = {
    Name = "production"
  }
}

resource "aws_db_parameter_group" "rds_parameter" {
  name   = "rdsparameter"
  family = "postgres16"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "postgres"
  engine_version         = "16.1"
  instance_class         = "db.t3.micro"
  username               = "postgres"
  password               = "postgres"
  parameter_group_name   = aws_db_parameter_group.rds_parameter.name
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name

}