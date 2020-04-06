variable "mysql_root_password" {
  description = "mysql root pass"
  default     = "@covid192020"
}
variable "ghost_db_username" {
  description = "ghost blog db user"
  default     = "root"
}
variable "ghost_db_name" {
  description = "ghost blog database name"
  default     = "ghost"
}
variable "mysql_network_alias" {
  description = "the network alias for mysql. in order for mysql and ghost to communicate."
  default     = "db"
}
variable "ghost_network_alias" {
  description = "the network alias for Ghost"
  default     = "ghost"
}
variable "ext_port" {
  description = "public port for ghost"
  default     = "8080"
}




