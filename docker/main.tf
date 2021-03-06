module "image" {
  source     = "./modules/image"
  image_name = var.image_name
}

module "container" {
  source         = "./modules/container"
  image          = module.image.image_out
  container_name = var.container_name
  int_port       = var.int_port
  ext_port       = var.ext_port
}
