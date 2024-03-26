
# Create var.az_count private subnets, each in a different AZ
/*resource "aws_subnet" "private1" {
  cidr_block        = "10.1.1.0/24"
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.main.id
  tags = {
      Name = "${var.layer}-${var.stack_id}-subnet-private1"
  }
}

resource "aws_subnet" "private2" {
  cidr_block        = "10.1.2.0/24"
  availability_zone = "${var.region}b"
  vpc_id            = aws_vpc.main.id
  tags = {
      Name = "${var.layer}-${var.stack_id}-subnet-private2"
  }
}

resource "aws_subnet" "private3" {
  cidr_block        = "10.1.3.0/24"
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.main.id
  tags = {
      Name = "${var.layer}-${var.stack_id}-subnet-private3"
  }
}

# Create var.az_count public subnets, each in a different AZ
resource "aws_subnet" "public1" {
  cidr_block              = "10.1.4.0/24"
  availability_zone       = "${var.region}a"
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
      Name = "${var.layer}-${var.stack_id}-subnet-public1"
  }
}

resource "aws_subnet" "public2" {
  cidr_block              = "10.1.5.0/24"
  availability_zone       = "${var.region}b"
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
      Name = "${var.layer}-${var.stack_id}-subnet-public2"
  }
}

resource "aws_subnet" "public3" {
  cidr_block              = "10.1.6.0/24"
  availability_zone       = "${var.region}c"
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
      Name = "${var.layer}-${var.stack_id}-subnet-public3"
  }
}
*/