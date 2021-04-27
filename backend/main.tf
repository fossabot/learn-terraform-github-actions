resource "aws_s3_bucket" "terraform" {
  bucket = "terraform-state-bucket-${var.account}"
  acl    = "private"

  # See https://www.terraform.io/docs/language/settings/backends/s3.html
  versioning {
    enabled = true
  }

  tags = {
    Description  = "Account Terraform backend S3"
    Provisioning = "Terraform"
  }
}

resource "aws_dynamodb_table" "terraform" {
  name         = "terraform-state-lock-${var.account}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  # See https://www.terraform.io/docs/language/settings/backends/s3.html#dynamodb-state-locking
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Description  = "Terraform backend DynamoDB"
    Provisioning = "Terraform"
  }
}
