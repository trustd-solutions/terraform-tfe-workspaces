locals {
  vendors = {
    "GOOGLE_CREDENTIALS" = tostring(try(var.GOOGLE_CREDENTIALS, null))

    #"AWS_SECRET_ACCESS_KEY" = var.AWS_SECRET_ACCESS_KEY == "disabled" ? var.AWS_SECRET_ACCESS_KEY : "not-used"
    #"AWS_SECRET_KEY_ID"     = var.AWS_SECRET_KEY_ID == "disabled" ? var.AWS_SECRET_KEY_ID : "not-used"
    #"AWS_SECRET_KEY_ID"     = tostring(try(var.AWS_SECRET_KEY_ID, null))
    #"GOOGLE_CREDENTIALS"    = var.GOOGLE_CREDENTIALS == "disabled" ? var.GOOGLE_CREDENTIALS : "not-used"
  }

  vendor_sensitive = flatten([
    for wk, workspace in var.workspaces : [
      for item in workspace.vendors_vars : {
        workspace_name = wk
        var_key        = item
        var_value      = lookup(local.vendors, item)
      }
    ]
  ])

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
