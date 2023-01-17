terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73.0"
    }
  }
}

provider "aws" {
  shared_credentials_file = "/home/amaurybsouza/.aws"
  profile                 = "devopsaws"
  region                  = "us-east-1"
}

module "server" {
  source    = "./modules/ec2"
  aws_ami  = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  tags      = { "Name" = "lab-terraform-tst", "Ambiente" = "Desenvolvimento" }
}