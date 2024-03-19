variable "stack_id" {
  description = "Nombre del proyecto"
  type        = string
  default     = "ticket"
}

variable "layer" {
  description = "Nombre del proyecto"
  type        = string
    default     = "dev"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

data "archive_file" "lambda_zip_inline" {
  type        = "zip"
  output_path = "/tmp/lambda_zip_inline.zip"
  source {
    content  = <<EOF
'use strict';
exports.handler = (event, context, callback) => {
  const request = event.Records[0].cf.request;
  // replace dangling / in the url with /index.html
  request.uri = request.uri.replace(//$/, '/index.html');
  // return to Cloudfront
  return callback(null, request);
};

EOF
    filename = "main.js"
  }
}