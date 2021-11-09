variable "allow_destroy_plan" {
  description = "Whether destroy plans can be queued on the workspace."
  type        = bool
  default     = true
}

variable "auto_apply" {
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  type        = bool
  default     = false
}

variable "execution_mode" {
  description = "Which execution mode to use. Valid values are `remote`, `local` or `agent`. When set to `local`, the workspace will be used for state storage only."
  type        = string
  default     = "remote"
}

variable "global_remote_state" {
  description = "Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (`remote_state_consumer_ids`)."
  type        = bool
  default     = true
}

variable "terraform_cloud_org" {
  description = "Terraform Cloud Org to create workspaces in"
  type        = string
}

variable "queue_all_runs" {
  description = "Whether the workspace should start automatically performing runs immediately after its creation. Runs triggered by a webhook (such as a commit in VCS) will not be queued until at least one run has been manually queued."
  type        = bool
  default     = false
}

variable "remote_state_consumer_ids" {
  description = "The set of workspace IDs set as explicit remote state consumers for the given workspace."
  type        = list(string)
  default     = []
}

variable "speculative_enabled" {
  description = "Whether this workspace allows speculative plans. Setting this to false prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors."
  type        = bool
  default     = true
}

variable "tag_names" {
  description = "A list of tag names for this workspace. List items must contain no special characters (`a-zA-Z0-9` only)."
  type        = list(string)
  default     = []
}

variable "workspaces" {
  description = "Map of workspaces definitions"
  type = map(object({
    terraform_version = string
    description       = string
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

variable "terraform_cloud_token" {
  description = "The Team token used to authenticate with Terraform Cloud. See [Authentication](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for more information"
  type        = string
}

variable "terraform_cloud_workspace_name" {
  description = "Terraform Cloud Bootstrap Workspace name"
  type        = string
}
