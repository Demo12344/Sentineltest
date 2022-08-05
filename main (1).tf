provider "aws" {
  region = "us-east-1"
}



resource "aws_servicecatalog_portfolio_share" "example" {
  principal_id = "390132021439"
  portfolio_id = aws_servicecatalog_portfolio.example.id
  type         = "ACCOUNT"
}
