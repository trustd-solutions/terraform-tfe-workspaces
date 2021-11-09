terraform {
  backend "remote" {
    organization = var.terraform_cloud_org
    workspaces {
      name = var.terraform_cloud_workspace_name
    }
  }
}
