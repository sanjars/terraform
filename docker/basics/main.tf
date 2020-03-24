# Download the latest Ghost image
# terraform plan -out=tfdev_plan -var env=dev
# terraform apply tfdev_plan
# terraform destroy -var env=dev
# terraform plan -out=tfprod_plan -var env=prod
# terraform apply tfprod_plan
# terraform destroy -var env=prod

resource "docker_image" "image_id" {
  name = lookup(var.image_name, var.env)
}

resource "docker_container" "container_id" {
  name  = lookup(var.container_name, var.env)
  image = docker_image.image_id.latest
  ports {
    internal = var.int_port
    external = lookup(var.ext_port, var.env)
  }
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = "echo ${docker_container.container_id.name}:${docker_container.container_id.ip_address} >> container.txt"
  }
}
