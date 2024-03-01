resource "aws_s3_bucket" "s3_front" {
  bucket = "${var.layer}-${var.stack_id}-bucket-front"

  tags = {
    Name        = "Front bucket"
    Environment = "${var.stack_id}"
  }
}

resource "aws_s3_bucket" "artifacts_bucket" {
  bucket = "${var.layer}-${var.stack_id}-artifacts-bucket"
  acl    = "private"

  tags = {
    Name = "${var.layer}-${var.stack_id}-artifacts-bucket"
    Environment = "${var.stack_id}"
  }
}