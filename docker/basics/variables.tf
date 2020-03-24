variable "env" {
  description = "env: dev or prod"
}

variable "image_name" {
  description = "Image for container."
  type = "map"
  default = {
    dev = "ghost:latest"
    prod = "ghost:alpine"
  }
}

variable "container_name" {
  description = "Name of the container."
  type = "map"
  default = {
    dev = "blog_dev"
    prod = "blog_prod"
  }

}

variable "int_port" {
  description = "Internal port for container"
  type        = number
  default     = 2368
}

variable "ext_port" {
  description = "External port for container"
  type        = map
  default = {
    dev = "8081"
    prod = "80"
  }
}
