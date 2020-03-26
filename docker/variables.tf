variable "image_name" {
  description = "Image for Container"
  default     = "ghost:alpine"
}
variable "container_name" {
  description = "Name of the container"
  default     = "ghost_blog"
}
variable "int_port" {
  description = "Internal port for container"
  default     = "2368"
}
variable "ext_port" {
  description = "External port for container"
  default     = "80"
}

