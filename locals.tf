locals {
  env_vars = flatten([
    for wk, workspace in var.workspaces : [
      for var_key, var_value in workspace.env_vars : {
        workspace_name = wk
        var_key        = var_key
        var_value      = var_value
      }
    ]
  ])

  sensitive_env_vars = flatten([
    for wk, workspace in var.workspaces : [
      for item in workspace.sensitive_env_vars : {
        workspace_name = wk
        item           = item
      }
    ]
  ])

  terraform_vars = flatten([
    for wk, workspace in var.workspaces : [
      for var_key, var_value in workspace.terraform_vars : {
        workspace_name = wk
        var_key        = var_key
        var_value      = var_value
      }
    ]
  ])

  sensitive_terraform_vars = flatten([
    for wk, workspace in var.workspaces : [
      for item in workspace.sensitive_terraform_vars : {
        workspace_name = wk
        item           = item
      }
    ]
  ])
}
