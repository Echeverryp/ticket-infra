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
