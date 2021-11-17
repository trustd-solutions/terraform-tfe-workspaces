resource "tfe_variable" "terraform_secret" {
  for_each     = { for v in local.sensitive_terraform_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "terraform"
  sensitive    = "true"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "terraform_variable" {
  for_each     = { for v in local.terraform_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "terraform"
  sensitive    = "false"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "environment_secret" {
  for_each     = { for v in local.sensitive_env_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "env"
  sensitive    = "true"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "environment_variable" {
  for_each     = { for v in local.env_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "env"
  sensitive    = "false"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}
