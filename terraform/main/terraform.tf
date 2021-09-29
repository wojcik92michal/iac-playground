
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.60.0"
    }

    cloudsigma = {
      source  = "cloudsigma/cloudsigma"
      version = "1.6.0"
    }
  }

  backend "s3" {
    bucket = "iac-workshops-terraform-state-bucket"
    key    = "common-state/terraform.tfstate"
    region = "eu-central-1"

    dynamodb_table = "iac-workshops-terraform-state-lock-table"
    encrypt        = "true"

    shared_credentials_file = "aws-creds"
  }
}
