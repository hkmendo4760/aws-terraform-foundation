terraform {
  cloud {
    organization = "hector-labs"

    workspaces {
      name = "aws-terraform-foundation"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}
