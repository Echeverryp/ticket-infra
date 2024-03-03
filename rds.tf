/*resource "aws_db_instance" "rds_emisor" {
  identifier                  = "${var.layer}-${var.stack_id}-db"
  allocated_storage    = 10
  db_name              = "ticket"
  engine               = "postgres"
  engine_version       = "13.13"
  instance_class       = "db.t3.micro"
  username             = "adminticket"
  password             = "adminticket"
  publicly_accessible = true
  multi_az                    = false
  skip_final_snapshot  = true
  db_subnet_group_name=aws_db_subnet_group.subnet_group_emisor.name
}*/