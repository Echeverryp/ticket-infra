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

variable "db_name" {
  type        = string
  default     = "ticket"
  description = "DB Name"
}

variable "engine_db" {
  type        = string
  default     = "postgres"
  description = "Engine for DB"
}

variable "engine_version_db" {
  type        = string
  default     = "13.13"
  description = "Version for DB"
}

variable "instance_class_db" {
  type        = string
  default     = "db.t3.micro"
  description = "Instance for DB"
}

variable "user_db" {
  type        = string
  default     = "adminticket"
  description = "User for DB"
}

variable "password_db" {
  type        = string
  default     = "adminticket"
  description = "Password DB"
}