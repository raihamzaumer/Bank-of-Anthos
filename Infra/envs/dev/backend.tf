terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket       = "boa-tfstate-buk-for-eks"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      Project     = "bank-of-anthos"
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}