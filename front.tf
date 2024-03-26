resource "aws_s3_bucket" "s3_front" {
  bucket = "${var.layer}-${var.stack_id}-bucket-front"

  tags = {
    Name        = "Front bucket"
    Environment = "${var.stack_id}"
  }
}



resource "aws_s3_bucket" "images_bucket" {
  bucket = "${var.layer}-${var.stack_id}-images-bucket"
  acl   =  "private"

  tags = {
    Name = "${var.layer}-${var.stack_id}-images-bucket"
    Environment = "${var.stack_id}"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_front_acess_control" {
  bucket = aws_s3_bucket.s3_front.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_cors_configuration" "s3_front_cors" {
  bucket = aws_s3_bucket.s3_front.id  

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }  
}

resource "aws_s3_bucket_policy" "s3_front_bucket_policy" {
    bucket = aws_s3_bucket.s3_front.id
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
            Sid= "S3GetObjectForCloudFront",
            Effect= "Allow",
            Principal= {
                "AWS": "*"
            },
            Action= "s3:GetObject",
            Resource= "arn:aws:s3:::${var.layer}-${var.stack_id}-bucket-front/*"
        }
    ]
  })
  
  depends_on = [aws_s3_bucket_public_access_block.s3_front_acess_control,aws_s3_bucket_cors_configuration.s3_front_cors ]
}

resource "aws_s3_bucket_ownership_controls" "s3_front_ownership" {
  bucket = aws_s3_bucket.s3_front.id
  rule {
    object_ownership = "ObjectWriter"
  }
  depends_on = [aws_s3_bucket_public_access_block.s3_front_acess_control, aws_s3_bucket_policy.s3_front_bucket_policy]
}


resource "aws_s3_bucket_acl" "acl_s3_front" {
    bucket = aws_s3_bucket.s3_front.id
    acl    = "private"
    depends_on = [aws_s3_bucket_ownership_controls.s3_front_ownership]
}


resource "aws_s3_bucket_website_configuration" "web_site_config_s3_front" {
  bucket = aws_s3_bucket.s3_front.id

  index_document {
    suffix = "index.html"
  }

}

locals {
  s3_origin_id   = "${var.layer}-${var.stack_id}-bucket-front-origin"
  s3_domain_name = "${var.layer}-${var.stack_id}-bucket-front.s3-website-${var.region}.amazonaws.com"
}

resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    custom_origin_config {
        http_port              = "80"
        https_port             = "443"
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
    domain_name              = local.s3_domain_name
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = local.s3_origin_id
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

   min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "allow-all"
  }

    # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/tickets-front/"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "allow-all"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "MyCloudFrontDistribution"
  }

   viewer_certificate {
    cloudfront_default_certificate = true
  }
}
