terraform {
  backend "s3" {
    bucket         = "tf-state-851725510286"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "tf-lock-851725510286"
    encrypt        = true
  }
}
