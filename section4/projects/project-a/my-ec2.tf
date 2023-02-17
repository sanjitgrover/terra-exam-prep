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

module "ec2module" {
    source  = "../../modules/ec2" 
}