output "public_subnet_id" {
    description = "Subnet ID"
    value = "${aws_subnet.subnet-main.id}"
}
output "vpc-id" {
    description = "To be exported for Security Group Module."
    value = "${aws_vpc.main-vpc.id}"
}
