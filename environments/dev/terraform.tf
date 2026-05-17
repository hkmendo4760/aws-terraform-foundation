terraform {
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

  required_version = ">= 1.2.0"
}
