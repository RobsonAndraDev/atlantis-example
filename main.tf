variable "region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-ck"
    key    = "eks_ck_new"
    region = "us-east-1"
  }
}

module "eks" {
  source = "./terraform"
}
