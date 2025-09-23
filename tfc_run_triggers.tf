resource "tfe_run_trigger" "this" {
  for_each      = local.run_triggers
  workspace_id  = tfe_workspace.this[each.value.workspace_id].id
  sourceable_id = each.value.sourceable_id
}