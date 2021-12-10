variable "workspaces" {
  description = "Map of workspaces definitions"
  type = map(object({
    allow_destroy_plan        = bool
    auto_apply                = bool
    prefix                    = string
    description               = string
    environment               = string
    execution_mode            = string
    global_remote_state       = bool
    queue_all_runs            = bool
    remote_state_consumer_ids = list(string)
    tag_names                 = list(string)
    terraform_version         = string
    speculative_enabled       = bool
    env_vars                  = map(string)
    terraform_vars            = map(string)
    sensitive_env_vars        = list(string)
    sensitive_terraform_vars  = list(string)
    vendors_vars              = list(string)
  }))
}

variable "vcs" {
  description = "Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow."
  type        = any
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

variable "aws_access_key_id" {
  description = "AWS_ACCESS_KEY_ID variable key"
  type        = string
  value       = "AWS_ACCESSS_KEY_ID"
}

variable "aws_secret_access_key" {
  description = "AWS_SECRET_ACCESS_KEY variable key"
  type        = string
  value       = "AWS_SECRET_ACCESSS_KEY"
}

variable "aws_access_key_id_value" {
  description = "AWS_ACCESS_KEY_ID variable value key"
  type        = string
}

variable "aws_secret_access_key_value" {
  description = "AWS_SECRET_ACCESS_KEY variable value key"
  type        = string
}

variable "google_credentials" {
  description = "GOOGLE_CREDENTIALS variable key"
  type        = string
  value       = "GOOGLE_CREDENTIALS"
}

variable "google_credentials_value" {
  description = "GOOGLE_CREDENTIALS variable value key"
  type        = string
}
