resource "aws_instance" "my-ec2"{
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = var.instance-type["us-east-1"]
  count = var.full_setup == true ? 2 : 1
  tags = {
    name = "${var.machine[count.index]}-machine"
  }
  
}

resource "aws_eip" "lb" {
  vpc      = true
  tags = local.common_tags
}

resource "aws_security_group" "allow_tls"{
  name = "my-security-group"
  
  ingress {
    from_port = 443
    to_port = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }
  tags = local.common_tags
}

resource "aws_eip_association" "my-eip-assoc" {
  instance_id   = aws_instance.my-ec2[0].id
  allocation_id = aws_eip.lb.id
} 

# resource "aws_s3_bucket" "my-bucket" {
#     bucket = "my-sanjit-bucket"
# }