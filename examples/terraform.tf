terraform {
  required_version = "1.10.3"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.62.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
  backend "remote" {
    organization = var.terraform_cloud_org
    workspaces {
      name = var.terraform_cloud_workspace_name
    }
  }
}
