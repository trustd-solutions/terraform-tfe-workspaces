resource "tfe_variable" "terraform_secret" {
  key          = "environment"
  value        = var.environment
  category     = "terraform"
  sensitive    = "true"
  workspace_id = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "terraform_variable" {
  key          = "environment"
  value        = var.environment
  category     = "terraform"
  sensitive    = "false"
  workspace_id = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "environment_secret" {
  key          = "github_token"
  value        = var.oauth_token_id
  category     = "env"
  sensitive    = "true"
  workspace_id = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "environment_variable" {
  key          = var.aws_access_key_id
  value        = var.aws_access_key_id_value
  category     = "env"
  sensitive    = "false"
  workspace_id = tfe_workspace.this[each.key].id
}
