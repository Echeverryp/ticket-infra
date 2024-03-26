# ALB Security group
# This is the group you need to edit if you want to restrict access to your application
/*resource "aws_security_group" "sg" {
  name        = "${var.layer}-${var.stack_id}-sg"
  description = "controls access sg"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "${var.layer}-${var.stack_id}-sg"
  }
ingress {
    protocol    = "all"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    protocol    = "tcp"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}*/
