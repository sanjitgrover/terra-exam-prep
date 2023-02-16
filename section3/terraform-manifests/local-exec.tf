resource "aws_instance" "local" {
  ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = "t2.micro"
  tags = {
    Name="local-exec-trial"
  } 


  provisioner "local-exec" {
    command="echo ${aws_instance.local.private_ip} >> private_ips.txt"
  }
}