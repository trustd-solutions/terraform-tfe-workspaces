resource "tfe_variable" "terraform_secret" {
  for_each     = var.workspaces
  key          = each.value.sensitive_terraform_vars.key
  value        = each.value.sensitive_terraform_vars.value
  category     = "terraform"
  sensitive    = "true"
  workspace_id = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "terraform_variable" {
  for_each     = var.workspaces
  key          = each.value.terraform_vars.key
  value        = each.value.terraform_vars.value
  category     = "terraform"
  sensitive    = "false"
  workspace_id = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "environment_secret" {
  for_each     = var.workspaces
  key          = each.value.sensitive_env_vars.key
  value        = each.value.sensitive_env_vars.value
  category     = "env"
  sensitive    = "true"
  workspace_id = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "environment_variable" {
  for_each     = var.workspaces
  key          = each.value.env_vars.key
  value        = each.value.env_vars.value
  category     = "env"
  sensitive    = "false"
  workspace_id = tfe_workspace.this[each.key].id
}
