terraform {
  required_version = ">= 1.5.0"

  # Wire this local directory directly to your live HCP Terraform workspace
  cloud {
    organization = "hector-labs"

    workspaces {
      name = "wsldc-guru-dev-oregon"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  # Enforcement of standardized naming conventions across your live dev account
  default_tags {
    tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
      Project     = "wsldc-guru-infrastructure"
    }
  }
}