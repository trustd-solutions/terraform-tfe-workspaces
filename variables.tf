variable "workspaces" {
  description = "Map of workspaces definitions"
  type = map(object({
    allow_destroy_plan        = bool
    auto_apply                = bool
    description               = string
    execution_mode            = string
    global_remote_state       = bool
    queue_all_runs            = bool
    remote_state_consumer_ids = list(string)
    tag_names                 = list(string)
    terraform_version         = string
    speculative_enabled       = bool
  }))
}

variable "vcs" {
  description = "Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow."
  type = map(object({
    identifier         = string
    branch             = string
    ingress_submodules = bool
    oauth_token_id     = string
  }))
}

variable "terraform_cloud_org" {
  description = "Terraform Cloud Org to create workspaces in"
  type        = string
}

variable "terraform_cloud_workspace_name" {
  description = "Terraform Cloud Bootstrap Workspace name"
  type        = string
}

variable "terraform_cloud_token" {
  description = "The Team token used to authenticate with Terraform Cloud. See [Authentication](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for more information"
  type        = string
}
