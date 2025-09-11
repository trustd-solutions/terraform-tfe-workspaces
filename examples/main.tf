module "workspaces" {
  source                = "../"
  terraform_cloud_org   = var.terraform_cloud_org
  terraform_cloud_token = var.terraform_cloud_token
  workspaces            = var.workspaces
  vcs                   = var.vcs
  workspace_settings    = var.workspace_settings
}
