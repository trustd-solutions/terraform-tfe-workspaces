variable "workspaces" {
  description = "Map of workspaces definitions"
  type = map(object({
    allow_destroy_plan             = optional(bool)
    assessments_enabled            = optional(bool)
    auto_apply                     = optional(bool)
    auto_apply_run_trigger         = optional(bool)
    auto_destroy_activity_duration = optional(string)
    auto_destroy_at                = optional(string)
    description                    = optional(string)
    environment                    = optional(string)
    file_triggers_enabled          = optional(bool)
    force_delete                   = optional(bool)
    ignore_additional_tags         = optional(bool)
    name                           = optional(string)
    project_name                   = optional(string)
    queue_all_runs                 = optional(bool)
    remote_state_consumer_ids      = optional(list(string))
    source_name                    = optional(string)
    source_url                     = optional(string)
    speculative_enabled            = optional(bool)
    ssh_key_id                     = optional(string)
    structured_run_output_enabled  = optional(bool)
    tag_names                      = optional(list(string))
    tags                           = optional(map(string))
    terraform_version              = optional(string)
    trigger_patterns               = optional(list(string))
    trigger_prefixes               = optional(list(string))
    working_directory_prefix       = optional(string)
    variable_set_names             = optional(list(string))
    env_vars                       = optional(map(string))
    terraform_vars                 = optional(map(string))
    vendors_vars                   = optional(map(string))
    run_triggers                   = optional(list(string))
  }))
  validation {
    condition = alltrue([
      for workspace_key, workspace in var.workspaces : !(
        workspace.auto_destroy_activity_duration != null && workspace.auto_destroy_at != null
      )
    ])
    error_message = "You must provide either 'auto_destroy_activity_duration' or 'auto_destroy_at', but not both"
  }
  validation {
    condition = alltrue([
      for workspace_key, workspace in var.workspaces : (
        (workspace.source_name != null && workspace.source_url != null) ||
        (workspace.source_name == null && workspace.source_url == null)
      )
    ])
    error_message = "If either 'source_name' or 'source_url' is provided, both must be provided"
  }
}

variable "vcs" {
  description = "Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow."
  type = object({
    branch                     = optional(string)
    identifier                 = string
    ingress_submodules         = optional(bool)
    oauth_token_id             = optional(string)
    github_app_installation_id = optional(string)
    tags_regex                 = optional(string)
  })
  validation {
    condition     = !(var.vcs["oauth_token_id"] != null && var.vcs["github_app_installation_id"] != null)
    error_message = "You must provide either 'oauth_token_id' or 'github_app_installation_id', but not both"
  }
}

variable "workspace_settings" {
  description = "Global Workspace settings."
  type = object({
    global_remote_state = optional(bool)
    execution_mode      = optional(string)
    agent_pool_id       = optional(string)
  })
  default = {}
}

variable "terraform_cloud_org" {
  description = "Terraform Cloud Org to create workspaces in"
  type        = string
}

variable "terraform_cloud_token" {
  description = "The Team token used to authenticate with Terraform Cloud. See [Authentication](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for more information"
  type        = string
}
