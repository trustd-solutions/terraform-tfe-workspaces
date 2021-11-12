resource "tfe_workspace" "this" {
  for_each                  = var.workspaces
  allow_destroy_plan        = each.value.allow_destroy_plan
  auto_apply                = each.value.auto_apply
  description               = each.value.description
  execution_mode            = each.value.execution_mode
  global_remote_state       = each.value.global_remote_state
  name                      = "${each.key}-${each.value.environment}"
  organization              = each.value.terraform_cloud_org
  queue_all_runs            = each.value.queue_all_runs
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
  speculative_enabled       = each.value.speculative_enabled
  tag_names                 = each.value.tag_names
  terraform_version         = each.value.terraform_version
  working_directory         = "${each.key}/"

  vcs_repo {
    branch             = each.value.vcs["branch"]
    identifier         = each.value.vcs["identifier"]
    ingress_submodules = each.value.vcs["ingress_submodules"]
    oauth_token_id     = each.value.vcs["oauth_token_id"]
  }
}
