
### Network

# Fetch AZs in the current region
/*data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {

      Name = "${var.layer}-${var.stack_id}-vpc"
  }
}

resource "aws_db_subnet_group" "subnet_group_ticket" {
  name       = "${var.layer}-${var.stack_id}-subnet-group"
  subnet_ids = [aws_subnet.public1.id, aws_subnet.public2.id,aws_subnet.public3.id]
  tags = {
    Name = "My DB Subnet Group"
  }
}*/