terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.38.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./module/ec2"
  ami    = "ami-053b0d53c279acc90"
}

module "Sg" {
  source = "./module/Sg"
}