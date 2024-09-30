terraform {
  required_version = "1.9.5"
  required_providers {
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
