variable "container_name" {
  description = "name of the container"
}
variable "ext_port" {
  type = number
  description = "port that will be used to access this app via browser"
}
variable "int_port" {
  type = number
  description = "intenal port for container"
}
variable "image" {
  description = "docker image"
}
