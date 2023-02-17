resource "aws_instance" "module-test" {
  ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = var.instance_type
  tags = {
    Name="module-test"
  } 
  }