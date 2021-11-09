<img src="https://trustd.solutions/images/logo.png"/>
# Terraform Cloud Workspace Bootstrap

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.aurora_instance_type](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aurora_replica_count](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aws_access_key_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aws_secret_access_key](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.datadog_api_key](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.datadog_app_key](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.db_password](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.domain_name](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_default_node_group_desired_capacity](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_default_node_group_instance_type](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_default_node_group_max_capacity](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_default_node_group_min_capacity](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_default_node_group_name](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_worker_node_group_desired_capacity](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_worker_node_group_instance_type](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_worker_node_group_max_capacity](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_worker_node_group_min_capacity](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.eks_worker_node_group_name](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.github_token](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.metabase_db_conn](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.metabase_rds_password](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.redis_instance_type](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.redis_password](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.region](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_destroy_plan"></a> [allow\_destroy\_plan](#input\_allow\_destroy\_plan) | Whether destroy plans can be queued on the workspace. | `bool` | `true` | no |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Whether to automatically apply changes when a Terraform plan is successful. | `bool` | `false` | no |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Which execution mode to use. Valid values are `remote`, `local` or `agent`. When set to `local`, the workspace will be used for state storage only. | `string` | `"remote"` | no |
| <a name="input_global_remote_state"></a> [global\_remote\_state](#input\_global\_remote\_state) | Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (`remote_state_consumer_ids`). | `bool` | `true` | no |
| <a name="input_queue_all_runs"></a> [queue\_all\_runs](#input\_queue\_all\_runs) | Whether the workspace should start automatically performing runs immediately after its creation. Runs triggered by a webhook (such as a commit in VCS) will not be queued until at least one run has been manually queued. | `bool` | `false` | no |
| <a name="input_remote_state_consumer_ids"></a> [remote\_state\_consumer\_ids](#input\_remote\_state\_consumer\_ids) | The set of workspace IDs set as explicit remote state consumers for the given workspace. | `list(string)` | `[]` | no |
| <a name="input_speculative_enabled"></a> [speculative\_enabled](#input\_speculative\_enabled) | Whether this workspace allows speculative plans. Setting this to false prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors. | `bool` | `true` | no |
| <a name="input_tag_names"></a> [tag\_names](#input\_tag\_names) | A list of tag names for this workspace. List items must contain no special characters (`a-zA-Z0-9` only). | `list(string)` | `[]` | no |
| <a name="input_terraform_cloud_org"></a> [terraform\_cloud\_org](#input\_terraform\_cloud\_org) | Terraform Cloud Org to create workspaces in | `string` | n/a | yes |
| <a name="input_terraform_cloud_token"></a> [terraform\_cloud\_token](#input\_terraform\_cloud\_token) | The Team token used to authenticate with Terraform Cloud. See [Authentication](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for more information | `string` | n/a | yes |
| <a name="input_vcs"></a> [vcs](#input\_vcs) | Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow. | <pre>map(object({<br>    identifier         = string<br>    branch             = string<br>    ingress_submodules = bool<br>    oauth_token_id     = string<br>  }))</pre> | n/a | yes |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | Map of workspaces definitions | <pre>map(object({<br>    terraform_version = string<br>    description       = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
