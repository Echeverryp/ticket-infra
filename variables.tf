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
export const handler = async (event) => {
  // TODO implement
  const response = {
    statusCode: 200,
    body: JSON.stringify('Hello from Lambda!'),
  };
  return response;
};

EOF
    filename = "main.js"
  }
}