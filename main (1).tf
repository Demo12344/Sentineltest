provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "source" {

  bucket   = "tf-test-bucketnidhi"
 }

resource "aws_iam_policy" "policy" {
  name        = "test_policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetAccessPoint",
          "s3:GetBucketPolicy",
          "s3:GetBucketAcl",
          "s3:GetBucketLocation",
          "s3:GetBucketLogging"
          ]
        Effect   = "Allow"
        Resource = "aws_s3_bucket.source.arn"
       },
    ]
  })
}
