/********
Variables
*********/
variable "aws-region" {
  type    = "string"
  default = "us-east-1"
}
variable "prefix" {
  default = "terra"
}
variable "email" {
  default = "example@example.com"
}
variable "aws_ami" {
  default = "ami-0a313d6098716f372"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "instance_count" {
  default = 3
}

