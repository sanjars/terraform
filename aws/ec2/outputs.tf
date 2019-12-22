output "InstanceID" {
  description = "The Instance ID"
  value       = "${aws_instance.Ec2Instance.*.id}"
}
output "PrivateIP" {
  value = "${aws_instance.Ec2Instance.*.private_ip}"
}
output "PrivateDNS" {
  value = "${aws_instance.Ec2Instance.*.private_dns}"
}