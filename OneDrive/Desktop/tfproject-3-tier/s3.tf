resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket"
  tags = {
    Name = "example"
  }
}

resource "aws_s3_bucket_versioning" "example_versioning" {
  bucket = aws_s3_bucket.example_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
