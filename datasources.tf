data "tfe_project" "this" {
  for_each     = var.workspaces
  name         = each.value.project_name
  organization = var.terraform_cloud_org
}
