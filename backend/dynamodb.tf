resource "aws_dynamodb_table" "tf_lock" {
  name         = "tf-lock-851725510286"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
