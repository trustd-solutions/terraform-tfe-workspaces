# Terraform Cloud Workspace Bootstrap

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10.3 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.68.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.68.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_run_trigger.this](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/resources/run_trigger) | resource |
| [tfe_variable.environment_variable](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/resources/variable) | resource |
| [tfe_variable.terraform_variable](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/resources/variable) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/resources/workspace) | resource |
| [tfe_workspace_settings.this](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/resources/workspace_settings) | resource |
| [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/resources/workspace_variable_set) | resource |
| [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/data-sources/project) | data source |
| [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/data-sources/variable_set) | data source |
| [tfe_workspace.run_triggers](https://registry.terraform.io/providers/hashicorp/tfe/0.68.2/docs/data-sources/workspace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_terraform_cloud_org"></a> [terraform\_cloud\_org](#input\_terraform\_cloud\_org) | Terraform Cloud Org to create workspaces in | `string` | n/a | yes |
| <a name="input_terraform_cloud_token"></a> [terraform\_cloud\_token](#input\_terraform\_cloud\_token) | The Team token used to authenticate with Terraform Cloud. See [Authentication](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for more information | `string` | n/a | yes |
| <a name="input_vcs"></a> [vcs](#input\_vcs) | Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow. | <pre>object({<br/>    branch                     = optional(string)<br/>    identifier                 = string<br/>    ingress_submodules         = optional(bool)<br/>    oauth_token_id             = optional(string)<br/>    github_app_installation_id = optional(string)<br/>    tags_regex                 = optional(string)<br/>  })</pre> | n/a | yes |
| <a name="input_workspace_settings"></a> [workspace\_settings](#input\_workspace\_settings) | Global Workspace settings. | <pre>object({<br/>    global_remote_state = optional(bool)<br/>    execution_mode      = optional(string)<br/>    agent_pool_id       = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | Map of workspaces definitions | <pre>map(object({<br/>    allow_destroy_plan             = optional(bool)<br/>    assessments_enabled            = optional(bool)<br/>    auto_apply                     = optional(bool)<br/>    auto_apply_run_trigger         = optional(bool)<br/>    auto_destroy_activity_duration = optional(string)<br/>    auto_destroy_at                = optional(string)<br/>    description                    = optional(string)<br/>    environment                    = optional(string)<br/>    file_triggers_enabled          = optional(bool)<br/>    force_delete                   = optional(bool)<br/>    ignore_additional_tags         = optional(bool)<br/>    name                           = optional(string)<br/>    project_name                   = optional(string)<br/>    queue_all_runs                 = optional(bool)<br/>    remote_state_consumer_ids      = optional(list(string))<br/>    source_name                    = optional(string)<br/>    source_url                     = optional(string)<br/>    speculative_enabled            = optional(bool)<br/>    ssh_key_id                     = optional(string)<br/>    structured_run_output_enabled  = optional(bool)<br/>    tag_names                      = optional(list(string))<br/>    tags                           = optional(map(string))<br/>    terraform_version              = optional(string)<br/>    trigger_patterns               = optional(list(string))<br/>    trigger_prefixes               = optional(list(string))<br/>    working_directory_prefix       = optional(string)<br/>    variable_set_names             = optional(list(string))<br/>    env_vars                       = optional(map(string))<br/>    terraform_vars                 = optional(map(string))<br/>    vendors_vars                   = optional(map(string))<br/>    run_triggers                   = optional(list(string))<br/>  }))</pre> | n/a | yes |

## Outputs

No outputs.
