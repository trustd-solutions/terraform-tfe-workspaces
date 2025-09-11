locals {
  env_vars = {
    for v in flatten([
      for key, workspace in var.workspaces : [
        for var_key, var_value in workspace.env_vars : {
          workspace_name = key
          var_key        = var_key
          var_value      = var_value
        }
      ]
    ]) : "${v.workspace_name}.${v.var_key}" => v
  }

  terraform_vars = {
    for v in flatten([
      for key, workspace in var.workspaces : [
        for var_key, var_value in workspace.terraform_vars : {
          workspace_name = key
          var_key        = var_key
          var_value      = var_value
        }
      ]
    ]) : "${v.workspace_name}.${v.var_key}" => v
  }

  run_triggers = {
    for item in flatten([
      for ws_key, ws in var.workspaces : [
        for trigger_workspace in(ws.run_triggers != null ? ws.run_triggers : []) : {
          workspace_name    = ws_key
          trigger_workspace = trigger_workspace
          sourceable_id     = data.tfe_workspace.run_triggers[trigger_workspace].id
          workspace_id      = ws_key
        }
      ]
    ]) : "${item.workspace_name}.${item.trigger_workspace}" => item
  }
}
