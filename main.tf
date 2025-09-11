resource "tfe_workspace" "this" {
  for_each                       = var.workspaces
  project_id                     = data.tfe_project.this[each.key].id
  allow_destroy_plan             = each.value.allow_destroy_plan
  assessments_enabled            = each.value.assessments_enabled
  auto_apply                     = each.value.auto_apply
  auto_apply_run_trigger         = each.value.auto_apply_run_trigger
  auto_destroy_activity_duration = each.value.auto_destroy_activity_duration
  auto_destroy_at                = each.value.auto_destroy_at
  description                    = each.value.description
  file_triggers_enabled          = each.value.file_triggers_enabled
  force_delete                   = each.value.force_delete
  ignore_additional_tag_names    = each.value.ignore_additional_tags
  name                           = each.value.name != null ? each.value.name : "${each.key}-${each.value.environment}"
  organization                   = var.terraform_cloud_org
  queue_all_runs                 = each.value.queue_all_runs
  source_name                    = each.value.source_name
  source_url                     = each.value.source_url
  speculative_enabled            = each.value.speculative_enabled
  ssh_key_id                     = each.value.ssh_key_id
  structured_run_output_enabled  = each.value.structured_run_output_enabled
  tag_names                      = each.value.tag_names
  terraform_version              = each.value.terraform_version
  trigger_patterns               = each.value.trigger_patterns
  trigger_prefixes               = each.value.trigger_prefixes
  working_directory              = each.value.working_directory_prefix != null ? "${each.value.working_directory_prefix}/${each.key}/" : "${each.key}/"
  vcs_repo {
    branch                     = var.vcs["branch"]
    identifier                 = var.vcs["identifier"]
    ingress_submodules         = var.vcs["ingress_submodules"]
    oauth_token_id             = var.vcs["oauth_token_id"]
    github_app_installation_id = var.vcs["github_app_installation_id"]
    tags_regex                 = var.vcs["tags_regex"]
  }
}

resource "tfe_workspace_settings" "this" {
  for_each                  = var.workspaces
  workspace_id              = tfe_workspace.this[each.key].id
  agent_pool_id             = var.workspace_settings.agent_pool_id
  execution_mode            = var.workspace_settings.execution_mode
  global_remote_state       = var.workspace_settings.global_remote_state
  remote_state_consumer_ids = each.value.global_remote_state == false ? each.value.remote_state_consumer_ids : null
}

resource "tfe_workspace_variable_set" "this" {
  for_each = {
    for item in flatten([
      for ws_key, ws in var.workspaces : [
        for vs_name in coalesce(ws.variable_set_names, []) : {
          workspace_key = ws_key
          varset_name   = vs_name
        }
      ]
    ]) : "${item.workspace_key}.${item.varset_name}" => item
  }
  variable_set_id = data.tfe_variable_set.this[each.value.varset_name].id
  workspace_id    = tfe_workspace.this[each.value.workspace_key].id
}
