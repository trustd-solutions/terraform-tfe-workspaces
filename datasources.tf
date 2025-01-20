data "tfe_project" "this" {
  for_each     = var.workspaces
  name         = each.value.project_name
  organization = var.terraform_cloud_org
}

data "tfe_variable_set" "this" {
  for_each     = var.workspaces
  name         = each.value.variable_set_name
  organization = var.terraform_cloud_org
}
