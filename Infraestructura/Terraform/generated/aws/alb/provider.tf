provider "aws" {
  region = "eu-north-1"
}

terraform {
  required_providers {
    aws = {
      version = "~> 4.20.1"
    }
  }
}
