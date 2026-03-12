terraform {
  backend "s3" {
    bucket         = "terraform-multi-env-state"
    key            = "terraform.tfstate"   # workspace auto-handles state
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}