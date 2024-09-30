terraform_cloud_workspace_name = "foo"
terraform_cloud_org            = "bar"
workspaces = {
  cloudtrail = {
    allow_destroy_plan        = true
    auto_apply                = true
    description               = "AWS CloudTrail Terraform Cloud Workspace"
    environment               = "dev"
    execution_mode            = "remote"
    global_remote_state       = true
    project_name              = "foo"
    queue_all_runs            = false
    remote_state_consumer_ids = []
    speculative_runs          = true
    tag_names                 = ["tag1", "tag2"]
    terraform_version         = "1.0.0"
    working_directory_prefix  = "aws"
    env_vars = {
      key  = "value",
      key1 = "value1",
    }
    terraform_vars = {
      key  = "value",
      key1 = "value1",
    }
  },
}
vcs = {
  branch             = "main"
  identifier         = "foo/infrastructure"
  ingress_submodules = false
  oauth_token_id     = "ot-abc1234"
}
