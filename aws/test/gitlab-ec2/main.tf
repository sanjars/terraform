resource "aws_instance" "gitlab" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${module.networking.subnet_id_main0}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = "true"
  #security_groups             = ["allow_ssh_and_gitlab"]
  security_groups = ["${module.networking.security_group_main1}"]

  tags = {
    Name        = "Engineer 1"
    Dept        = "Engineering"
    Created_by  = "Sanjar"
    Application = "SCM"
    Purpose     = "Test"
  }


  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file("~/.ssh/id_rsa")}"



    }
    inline = [
      "sudo yum -y install curl policycoreutils openssh-server openssh-clients postfix",
      "sudo systemctl start sshd",
      "sudo systemctl start postfix",
      "sudo systemctl enable sshd",
      "sudo systemctl enable postfix",
      "sudo curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash",
      "sudo EXTERNAL_URL='http://gitlab.beam-soul'",
      "sudo yum -y install gitlab-ce",
      "sudo gitlab-ctl reconfigure"
    ]
  }

  depends_on = ["module.networking"]

  timeouts {
    create = "15m"
    delete = "10m"
  }

}

module "networking" {
  source = "../networking"

}

