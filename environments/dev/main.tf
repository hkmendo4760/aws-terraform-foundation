# Baseline Live Development VPC
resource "aws_vpc" "dev_core" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "wsldc-guru-dev-vpc"
  }
}

# Example Internet Gateway to anchor your public edge
resource "aws_internet_gateway" "dev_gw" {
  vpc_id = aws_vpc.dev_core.id

  tags = {
    Name = "wsldc-guru-dev-igw"
  }
}