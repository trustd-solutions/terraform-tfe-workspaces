resource "tfe_variable" "terraform_variable" {
  for_each     = { for v in local.terraform_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "terraform"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "environment_variable" {
  for_each     = { for v in local.env_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "env"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}
