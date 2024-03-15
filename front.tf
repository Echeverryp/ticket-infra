resource "aws_s3_bucket" "s3_front" {
  bucket = "${var.layer}-${var.stack_id}-bucket-front"
  acl    = "private"
  tags = {
    Name        = "Front bucket"
    Environment = "${var.stack_id}"
  }
}

resource "aws_s3_bucket" "images_bucket" {
  bucket = "${var.layer}-${var.stack_id}-images-bucket"
  acl    = "private"

  tags = {
    Name = "${var.layer}-${var.stack_id}-images-bucket"
    Environment = "${var.stack_id}"
  }
}