# Download the latest Ghost image
resource "docker_image" "image_id" {
  # can be either ghost:latest or ghost:alpine 
  name = "ghost:latest"
}

resource "docker_container" "container_id" {
  name  = "ghost_blog"
  image = docker_image.image_id.latest
  ports {
    internal = "2368"
    external = "80"
  }
}
