terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }


  

  backend "s3" {
    bucket = "remote-state-manu"
    key    = "TF_REMOTE_STATE_DEMO"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}


provider "aws" {
  # Configuration options
}