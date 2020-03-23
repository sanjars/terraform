output "container_name" {
  value       = docker_container.container_id.name
  description = "container name"
}

output "ip_address" {
        value = docker_container.container_id.ip_address
        description = "IP address of the container"

}
