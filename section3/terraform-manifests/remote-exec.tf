resource "aws_instance" "this" {
  ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = "t2.small"
  key_name = "terraform-key"
 
 connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("${path.module}/private/terraform-key.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx",
    ]
  }
}