provider "aws" {
  region = "${var.aws-region}"
}
resource "aws_network_acl" "main-nacl" {
    vpc_id = "${var.vpc-id}"
    subnet_ids = ["${var.public_subnet_id}"]

    ## Traffic-Out
    egress {
        protocol    = "tcp"
        rule_no     = "100"
        action      = "allow"
        cidr_block  = "0.0.0.0/0"
        from_port   = "0"
        to_port     = "65535"
    }
    egress {
        protocol    = "tcp"
        rule_no     = "200"
        action      = "allow"
        cidr_block  = "0.0.0.0/0"
        from_port   = "443"
        to_port     = "443"
    }
    egress {
        protocol    = "tcp"
        rule_no     = "300"
        action      = "allow"
        cidr_block  = "0.0.0.0/0"
        from_port   = "80"
        to_port     = "80"
    }

    ## Traffic-In
    ingress {
        protocol    = "tcp"
        rule_no     = "110"
        action      = "allow"
        cidr_block  = "0.0.0.0/0"
        from_port   = "22"
        to_port     = "22"
    }
    ingress {
        protocol    = "tcp"
        rule_no     = "220"
        action      = "allow"
        cidr_block  = "0.0.0.0/0"
        from_port   = "443"
        to_port     = "443"
    }
    ingress {
        protocol    = "tcp"
        rule_no     = "330"
        action      = "allow"
        cidr_block  = "0.0.0.0/0"
        from_port   = "80"
        to_port     = "80"
    }

    ## Tags
    tags {
        Email = "${var.email}"
    }
    tags {
        Name = "${var.prefix}-nacl-${module.random-string.string-result}"
    }

}

module "random-string" {
  source = "../../generate-random-string"
}
