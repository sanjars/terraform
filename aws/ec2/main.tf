/******
Provider
*******/
provider "aws" {
  region = "${var.aws-region}"
}

/********
Resources
*********/

#######
# EC2 #
#######
resource "aws_instance" "Ec2Instance" {
  # vpc_security_group_ids = ["${aws_security_group.Ec2InstanceSecurityGroup.id}"]
  vpc_security_group_ids = ["${module.security-group.this_security_group_id}"]
  key_name = "${aws_key_pair.key-pair.key_name}"
  instance_initiated_shutdown_behavior = "stop"
  ami = "${var.aws_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${module.vpc-subnet.public_subnet_id}"
  monitoring = "false"
  count = "${var.instance_count}"

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    delete_on_termination = "true"
    volume_size = "20"
  }

  tags {
    Email = "${var.email}"
  }
  tags {
    Name = "${var.prefix}-vm-${module.random-string.string-result}"
  }

  depends_on = ["module.vpc-subnet"]
  depends_on = ["module.security-group"]
}

resource "aws_key_pair" "key-pair" {
  key_name = "${var.prefix}-key"
  public_key = "${file("~/.ssh/terra-key.pub")}"
}

/******
Modules
*******/
module "security-group" {
  source = "../networking/security-groups"

  vpc-id = "${module.vpc-subnet.vpc-id}"
}

module "vpc-subnet" {
  source = "../networking/vpc-igw-rt-subnet"
}

module "nacl-main" {
  source = "../networking/nacl"

  vpc-id = "${module.vpc-subnet.vpc-id}"
  public_subnet_id = "${module.vpc-subnet.public_subnet_id}"
}

module "random-string" {
  source = "../generate-random-string"
}
