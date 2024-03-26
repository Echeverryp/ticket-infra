resource "aws_db_instance" "ticket_rds" {
  identifier                  = "${var.layer}-${var.stack_id}-db"
  allocated_storage    = 10
  db_name              = "${var.db_name}"
  engine               = "${var.engine_db}"
  engine_version       = "${var.engine_version_db}"
  instance_class       = "${var.instance_class_db}"
  username             = "${var.user_db}"
  password             = "${var.password_db}"
  publicly_accessible = true
  multi_az                    = false
  skip_final_snapshot  = true
  vpc_security_group_ids= [aws_security_group.sg.id]
 db_subnet_group_name=aws_db_subnet_group.subnet_group_ticket.name
}