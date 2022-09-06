terraform {
  required_version = ">= 0.13.0"
  backend "s3" {
    bucket = "pathways-dojo"
    key    = "julio-pimentel-tfstate-main"
    region = "us-east-1"
  }
}