resource "tfe_variable" "terraform_secret" {
  for_each     = { for v in local.sensitive_terraform_vars : "${v.workspace_name}.${v.item}" => v }
  key          = each.value.item
  value        = "CHANGE_IT"
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "terraform_variable" {
  for_each     = { for v in local.terraform_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "terraform"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "environment_secret" {
  for_each     = { for v in local.sensitive_env_vars : "${v.workspace_name}.${v.item}" => v }
  key          = each.value.item
  value        = "CHANGE_IT"
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "environment_variable" {
  for_each     = { for v in local.env_vars : "${v.workspace_name}.${v.var_key}" => v }
  key          = each.value.var_key
  value        = each.value.var_value
  category     = "env"
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

# vendors specifics tfe_variable resources
#resource "tfe_variable" "google_credential" {
#for_each     = var.workspaces
#key          = var.google_credentials
#value        = var.google_credentials_value
#category     = "env"
#workspace_id = tfe_workspace.this[each.key].id
#}

resource "tfe_variable" "aws_key_id" {
  for_each     = var.workspaces
  key          = var.aws_access_key_id
  value        = var.aws_access_key_id_value
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "aws_secret_access_key" {
  for_each     = var.workspaces
  key          = var.aws_secret_access_key
  value        = var.aws_secret_access_key_value
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
}
