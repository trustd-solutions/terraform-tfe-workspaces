locals {
  env_vars = flatten([
    for k, workspace in var.workspaces : [
      for var_key, var_value in workspace.env_vars : {
        workspace_name = k
        var_key        = var_key
        var_value      = var_value
      }
    ]
  ])

  terraform_vars = flatten([
    for k, workspace in var.workspaces : [
      for var_key, var_value in workspace.terraform_vars : {
        workspace_name = k
        var_key        = var_key
        var_value      = var_value
      }
    ]
  ])

}
