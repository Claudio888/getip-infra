provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "packer-terraform-ansible-deploy"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}

