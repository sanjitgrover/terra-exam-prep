terraform {
    required_providers{
        aws = {
      source = "hashicorp/aws"
      version = "4.54.0"
    }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
     ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = lookup(var.instance_type, terraform.workspace) 
  tags = {
    Name="workspace-test"
  } 
}

variable "instance_type" {
    type = map
    default = {
        default = "t2.nano"
        dev = "t2.micro"
        prod = "t2.small" 
    }
}