/********
Resources
*********/
provider "aws" {
  region = "${var.aws-region}"
}
#######
# VPC #
#######
resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags {
    Email = "${var.email}"
  }
  tags {
    Name = "${var.prefix}-vpc-${module.random-string.string-result}"
  }
}

#######
# IGW #
#######
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main-vpc.id}"

    tags {
        Email = "${var.email}"
    }
    tags {
        Name = "${var.prefix}-igw-${module.random-string.string-result}"
    }
}

###############
# Route Table #
###############
resource "aws_route_table" "main-rt" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }

    tags {
        Email = "${var.email}"
    }
    tags {
        Name = "${var.prefix}-rt-${module.random-string.string-result}"
    }
}

resource "aws_route_table_association" "main-rt-subnet-assoc" {
    subnet_id = "${aws_subnet.subnet-main.id}"
    route_table_id = "${aws_route_table.main-rt.id}"
}

##########
# Subnet #
##########
resource "aws_subnet" "subnet-main" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags {
        Email = "${var.email}"
    }
    tags {
        Name = "${var.prefix}-public-subnet-${module.random-string.string-result}"
    }

    depends_on = ["aws_vpc.main-vpc"]
}

module "random-string" {
  source = "../../generate-random-string"

}
