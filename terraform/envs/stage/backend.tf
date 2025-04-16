terraform {
  backend "s3" {
    bucket         = "securebanking-tfstate"
    key            = "stage/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
