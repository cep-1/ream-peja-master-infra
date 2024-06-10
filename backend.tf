terraform {
  backend "s3" {
    bucket = "tf-bucket-team-peja"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}