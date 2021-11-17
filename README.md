<img src="https://trustd.solutions/images/logo.png"/>
# Terraform Cloud Workspace Bootstrap

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.45.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.environment_secret](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.environment_variable](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.terraform_secret](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.terraform_variable](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_terraform_cloud_org"></a> [terraform\_cloud\_org](#input\_terraform\_cloud\_org) | Terraform Cloud Org to create workspaces in | `string` | n/a | yes |
| <a name="input_terraform_cloud_token"></a> [terraform\_cloud\_token](#input\_terraform\_cloud\_token) | The Team token used to authenticate with Terraform Cloud. See [Authentication](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for more information | `string` | n/a | yes |
| <a name="input_terraform_cloud_workspace_name"></a> [terraform\_cloud\_workspace\_name](#input\_terraform\_cloud\_workspace\_name) | Terraform Cloud Bootstrap Workspace name | `string` | n/a | yes |
| <a name="input_vcs"></a> [vcs](#input\_vcs) | Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow. | `any` | n/a | yes |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | Map of workspaces definitions | <pre>map(object({<br>    allow_destroy_plan        = bool<br>    auto_apply                = bool<br>    description               = string<br>    environment               = string<br>    execution_mode            = string<br>    global_remote_state       = bool<br>    queue_all_runs            = bool<br>    remote_state_consumer_ids = list(string)<br>    tag_names                 = list(string)<br>    terraform_version         = string<br>    speculative_enabled       = bool<br>    env_vars                  = map(string)<br>    terraform_vars            = map(string)<br>    sensitive_env_vars        = list(string)<br>    sensitive_terraform_vars  = list(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
