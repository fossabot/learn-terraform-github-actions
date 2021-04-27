terraform {
  required_version = ">= 0.15"
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
}

provider "aws" {
  profile = var.account
  region  = var.region
}
