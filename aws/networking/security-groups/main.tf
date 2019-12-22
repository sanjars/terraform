provider "aws" {
  region = "${var.aws-region}"
}
module "self_service_sg" {
  source = "terraform-aws-modules/security-group/aws"
  name        = "${var.prefix}-sg-${module.random-string.string-result}"
  description = "Security group for EC2s"
  vpc_id      = "${var.vpc-id}"
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Office SSH Access"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Secure Web Traffic"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Non Secure Web Traffic"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Home SSH Access"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags {
    Email = "${var.email}"
  }
  tags {
    Name = "${var.prefix}-sg-${module.random-string.string-result}"
  }
}

module "random-string" {
  source = "../../generate-random-string"
}
