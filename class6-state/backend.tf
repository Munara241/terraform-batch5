terraform {
  backend "s3" {
    bucket = "kaizen-munara"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
  }
}
