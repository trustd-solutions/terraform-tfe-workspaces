data "tfe_project" "this" {
  for_each     = var.workspaces
  name         = each.value.project_name
  organization = var.terraform_cloud_org
}

data "tfe_variable_set" "this" {
  for_each = toset(
    flatten([
      for k, v in var.workspaces : v.variable_set_names
    ])
  )
  name         = each.value
  organization = var.terraform_cloud_org
}

data "tfe_workspace" "run_triggers" {
  for_each = toset(
    flatten([
      for k, v in var.workspaces : v.run_triggers != null ? v.run_triggers : []
    ])
  )
  name         = each.value
  organization = var.terraform_cloud_org
}
