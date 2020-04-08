resource "docker_network" "public_bridge_network" {
  name   = "public_ghost_network"
  driver = "overlay" # spans the network over multiple hosts like in Docker Swarm
}
resource "docker_network" "private_bridge_network" {
  name     = "ghost_mysql_internal"
  driver   = "overlay"
  internal = true
}
