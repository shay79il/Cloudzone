terraform {
  required_providers {
    aws = {
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                   = var.region
  shared_credentials_files = var.aws_cred_paths
  profile                  = var.aws_profile

  default_tags {
    tags = {
      Environment   = var.env
      Department    = "DevOps"
      Owner         = "Shay G."
      ProvisionedBy = "Terraform"
      Temp          = "True"
    }
  }
}
