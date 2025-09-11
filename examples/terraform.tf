terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.68.0"
    }
  }
  backend "remote" {
    organization = "example-org"
    workspaces {
      name = "terraform-tfe-workspaces-example"
    }
  }
}

provider "tfe" {
  token = var.terraform_cloud_token
}
