module "workspaces" {
  source                         = "trustd-solutions/workspaces/tfe"
  version                        = "1.1.0"
  terraform_cloud_org            = var.terraform_cloud_org
  terraform_cloud_workspace_name = var.terraform_cloud_workspace_name
  terraform_cloud_token          = var.terraform_cloud_token
  workspaces                     = var.workspaces
  vcs                            = var.vcs
}
