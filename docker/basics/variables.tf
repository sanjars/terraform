variable "image_name" {
  description = "Image for container."  default     = "ghost:latest"
}

variable "container_name" {
  description = "Name of the container."
  default     = "blog"
}

variable "int_port" {
  description = "Internal port for container"
  type        = number
  default     = 2368
}

variable "ext_port" {
  description = "External port for container"
  type        = number
  default     = 80
}
